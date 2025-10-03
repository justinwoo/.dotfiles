#!/usr/bin/env python3

import os
import sys
from pathlib import Path
from wand.image import Image
from wand.display import display
import tempfile
import shutil

class CollageGenerator:
    def __init__(self, input_dir=".", output_file="collage.jpg"):
        self.input_dir = Path(input_dir)
        self.output_file = output_file
        self.temp_dir = tempfile.mkdtemp()

        # Configuration for hybrid layout
        self.canvas_width = 1200  # Total canvas width
        self.portrait_columns = 2  # Always 2 columns for portraits
        self.spacing = 15
        self.bg_color = "white"
        self.quality = 99

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        # Cleanup temp directory
        shutil.rmtree(self.temp_dir, ignore_errors=True)

    def get_image_files(self):
        """Get all image files from the input directory, excluding collage files"""
        extensions = ['*.jpg', '*.jpeg', '*.png', '*.gif', '*.bmp', '*.heic']
        image_files = []

        for ext in extensions:
            image_files.extend(self.input_dir.glob(ext))
            image_files.extend(self.input_dir.glob(ext.upper()))

        # Filter out any files starting with "collage" to avoid using them as input
        image_files = [f for f in image_files if not f.name.lower().startswith('collage')]

        return sorted(image_files, key=lambda x: x.name.lower())

    def analyze_images(self, image_files):
        """Analyze all images to determine orientations and calculate optimal dimensions"""
        orientations = []
        aspect_ratios = []

        for img_path in image_files:
            try:
                with Image(filename=str(img_path)) as img:
                    img.auto_orient()
                    width, height = img.width, img.height
                    aspect_ratio = width / height

                    if width > height:
                        orientations.append('landscape')
                    elif height > width:
                        orientations.append('portrait')
                    else:
                        orientations.append('square')

                    aspect_ratios.append(aspect_ratio)
            except Exception as e:
                print(f"Error analyzing {img_path.name}: {e}")
                orientations.append('square')
                aspect_ratios.append(1.0)

        return orientations, aspect_ratios

    def calculate_smart_dimensions(self, orientations, aspect_ratios, num_images):
        """Calculate optimal dimensions based on image analysis"""
        landscape_count = orientations.count('landscape')
        portrait_count = orientations.count('portrait')

        # Determine if we have more portrait or landscape images
        mostly_portrait = portrait_count > landscape_count

        if mostly_portrait:
            # For portrait-dominant collections, use taller thumbnails
            base_width = 300
            base_height = 400
            columns = 2 if num_images <= 6 else 3
        else:
            # For landscape-dominant collections, use wider thumbnails
            base_width = 400
            base_height = 300
            columns = 3 if num_images <= 9 else 4

        # Calculate average aspect ratio to fine-tune dimensions
        avg_aspect = sum(aspect_ratios) / len(aspect_ratios) if aspect_ratios else 1.0

        if avg_aspect > 1.3:  # Wide images
            base_width = int(base_width * 1.2)
        elif avg_aspect < 0.8:  # Tall images
            base_height = int(base_height * 1.2)

        return base_width, base_height, columns

    def calculate_masonry_dimensions(self, image_files, target_width):
        """Calculate dimensions for each image maintaining aspect ratio"""
        image_info = []

        for img_path in image_files:
            try:
                with Image(filename=str(img_path)) as img:
                    img.auto_orient()
                    original_width = img.width
                    original_height = img.height

                    # Calculate height that maintains aspect ratio for target width
                    aspect_ratio = original_width / original_height
                    scaled_height = int(target_width / aspect_ratio)

                    image_info.append({
                        'path': img_path,
                        'width': target_width,
                        'height': scaled_height,
                        'aspect_ratio': aspect_ratio
                    })
            except Exception as e:
                print(f"Error analyzing {img_path.name}: {e}")
                # Use square dimensions as fallback
                image_info.append({
                    'path': img_path,
                    'width': target_width,
                    'height': target_width,
                    'aspect_ratio': 1.0
                })

        return image_info

    def calculate_masonry_layout(self, image_info, columns, spacing):
        """Calculate positions for masonry layout"""
        # Initialize column heights
        column_heights = [0] * columns
        layout = []

        # Use the width from the first image (they should all be the same width)
        column_width = image_info[0]['width'] if image_info else 300

        for img_info in image_info:
            # Find the shortest column
            shortest_col = column_heights.index(min(column_heights))

            # Calculate position
            x = shortest_col * (column_width + spacing)
            y = column_heights[shortest_col]

            layout.append({
                'path': img_info['path'],
                'x': x,
                'y': y,
                'width': img_info['width'],
                'height': img_info['height']
            })

            # Update column height
            column_heights[shortest_col] += img_info['height'] + spacing

        # Calculate final canvas dimensions
        canvas_width = columns * column_width + (columns - 1) * spacing
        canvas_height = max(column_heights) - spacing  # Remove last spacing

        return layout, canvas_width, canvas_height

    def classify_images(self, image_files):
        """Classify images as landscape or portrait"""
        landscape_images = []
        portrait_images = []

        for img_path in image_files:
            try:
                with Image(filename=str(img_path)) as img:
                    img.auto_orient()
                    if img.width > img.height:
                        landscape_images.append(img_path)
                    else:
                        portrait_images.append(img_path)
            except Exception as e:
                print(f"Error analyzing {img_path.name}: {e}")
                # Default to portrait if error
                portrait_images.append(img_path)

        return landscape_images, portrait_images

    def calculate_hybrid_layout(self, landscape_images, portrait_images):
        """Calculate hybrid layout with full-width landscape rows and portrait rows"""
        layout = []
        current_y = 0

        # Calculate portrait column width
        portrait_width = (self.canvas_width - (self.portrait_columns - 1) * self.spacing) // self.portrait_columns

        # Process images and balance portraits around landscapes
        image_files = self.get_image_files()

        # Split into groups around landscapes
        groups = []
        current_portraits = []

        for img_path in image_files:
            if img_path in landscape_images:
                if current_portraits:
                    groups.append(('portraits', current_portraits))
                    current_portraits = []
                groups.append(('landscape', img_path))
            else:
                current_portraits.append(img_path)

        if current_portraits:
            groups.append(('portraits', current_portraits))

        # Balance portrait groups around landscapes
        for i in range(len(groups)):
            if (groups[i][0] == 'portraits' and
                i + 1 < len(groups) and groups[i + 1][0] == 'landscape' and
                i + 2 < len(groups) and groups[i + 2][0] == 'portraits'):

                # We have portraits-landscape-portraits, balance them
                before_portraits = groups[i][1]
                after_portraits = groups[i + 2][1]
                total_portraits = before_portraits + after_portraits

                # Split evenly
                mid_point = len(total_portraits) // 2
                groups[i] = ('portraits', total_portraits[:mid_point])
                groups[i + 2] = ('portraits', total_portraits[mid_point:])

        # Process the groups
        for group_type, content in groups:
            if group_type == 'landscape':
                current_y = self.add_landscape_row(layout, content, current_y)
            else:
                current_y = self.process_portrait_group(layout, content, current_y)

        # Calculate final canvas height
        canvas_height = current_y - self.spacing if layout else 0
        return layout, self.canvas_width, canvas_height

    def add_landscape_row(self, layout, img_path, current_y):
        """Add a full-width landscape image to the layout"""
        with Image(filename=str(img_path)) as img:
            img.auto_orient()
            aspect_ratio = img.width / img.height
            landscape_height = int(self.canvas_width / aspect_ratio)

            layout.append({
                'path': img_path,
                'x': 0,
                'y': current_y,
                'width': self.canvas_width,
                'height': landscape_height,
                'type': 'landscape'
            })

            return current_y + landscape_height + self.spacing

    def add_portrait_row(self, layout, portrait_images, current_y):
        """Add a row of portrait images to the layout"""
        if not portrait_images:
            return current_y

        if len(portrait_images) == 1:
            # Single portrait gets full width
            img_path = portrait_images[0]
            with Image(filename=str(img_path)) as img:
                img.auto_orient()
                aspect_ratio = img.width / img.height
                full_height = int(self.canvas_width / aspect_ratio)

                layout.append({
                    'path': img_path,
                    'x': 0,
                    'y': current_y,
                    'width': self.canvas_width,
                    'height': full_height,
                    'type': 'portrait'
                })

                return current_y + full_height + self.spacing
        else:
            # Two portraits side by side
            portrait_width = (self.canvas_width - self.spacing) // 2
            max_height = 0

            for i, img_path in enumerate(portrait_images):
                with Image(filename=str(img_path)) as img:
                    img.auto_orient()
                    aspect_ratio = img.width / img.height
                    portrait_height = int(portrait_width / aspect_ratio)

                    layout.append({
                        'path': img_path,
                        'x': i * (portrait_width + self.spacing),
                        'y': current_y,
                        'width': portrait_width,
                        'height': portrait_height,
                        'type': 'portrait'
                    })

                    max_height = max(max_height, portrait_height)

            return current_y + max_height + self.spacing

    def process_portrait_group(self, layout, portrait_images, current_y):
        """Process a group of portraits, avoiding single orphaned images"""
        if not portrait_images:
            return current_y

        num_portraits = len(portrait_images)

        if num_portraits == 1:
            # Single portrait gets full width
            current_y = self.add_portrait_row(layout, portrait_images, current_y)
        elif num_portraits == 2:
            # Two portraits in one row
            current_y = self.add_portrait_row(layout, portrait_images, current_y)
        elif num_portraits == 3:
            # Three portraits: first gets full width, then two together
            current_y = self.add_portrait_row(layout, [portrait_images[0]], current_y)
            current_y = self.add_portrait_row(layout, portrait_images[1:3], current_y)
        else:
            # Four or more portraits: group in pairs, handle remainder smartly
            i = 0
            while i < num_portraits:
                if i + 1 == num_portraits - 1:
                    # Last two portraits - put them together
                    current_y = self.add_portrait_row(layout, portrait_images[i:i+2], current_y)
                    i += 2
                elif i == num_portraits - 1:
                    # Single remaining portrait - give it full width
                    current_y = self.add_portrait_row(layout, [portrait_images[i]], current_y)
                    i += 1
                else:
                    # Regular pair
                    current_y = self.add_portrait_row(layout, portrait_images[i:i+2], current_y)
                    i += 2

        return current_y


    def process_image_for_hybrid(self, image_path, target_width, target_height):
        """Process image for hybrid layout - resize maintaining aspect ratio"""
        with Image(filename=str(image_path)) as img:
            # Auto-orient based on EXIF data
            img.auto_orient()

            # Use high-quality resampling filter for better quality
            img.filter = 'lanczos'

            # Resize to exact dimensions (aspect ratio already calculated)
            img.resize(target_width, target_height)

            return img.clone()

    def calculate_optimal_columns(self, num_images):
        """Calculate optimal number of columns for better distribution"""
        import math

        # For 9 images, 3x3 is perfect
        if num_images <= 4:
            return 2
        elif num_images <= 9:
            return 3
        elif num_images <= 16:
            return 4
        else:
            return int(math.ceil(math.sqrt(num_images)))

    def create_collage(self):
        """Create hybrid layout collage with full-width landscape rows"""
        image_files = self.get_image_files()

        if not image_files:
            print(f"No images found in {self.input_dir}")
            return False

        print(f"Found {len(image_files)} images. Creating hybrid layout...")

        # Classify images by orientation
        landscape_images, portrait_images = self.classify_images(image_files)

        print(f"Images: {len(portrait_images)} portrait, {len(landscape_images)} landscape")
        print(f"Landscape images will get full-width rows, portraits use 2 columns (single portraits get full width)")

        # Calculate hybrid layout
        layout, canvas_width, canvas_height = self.calculate_hybrid_layout(
            landscape_images, portrait_images
        )

        print(f"Canvas size: {canvas_width}x{canvas_height}")
        print("Processing and compositing images...")

        # Create final canvas
        with Image(width=canvas_width, height=canvas_height, background=self.bg_color) as canvas:
            for i, item in enumerate(layout):
                try:
                    # Process image
                    with self.process_image_for_hybrid(
                        item['path'], item['width'], item['height']
                    ) as processed_img:
                        # Composite onto canvas at calculated position
                        canvas.composite(processed_img, left=item['x'], top=item['y'])
                        img_type = "landscape" if item.get('type') == 'landscape' else "portrait"
                        print(f"Placed {i+1}/{len(layout)} ({img_type}): {item['path'].name}")

                except Exception as e:
                    print(f"Error processing {item['path'].name}: {e}")

            # Set output quality and save
            canvas.compression_quality = self.quality
            canvas.save(filename=self.output_file)

        print(f"Hybrid layout collage saved as: {self.output_file}")
        return True

def main():
    import argparse

    parser = argparse.ArgumentParser(
        description='Create a hybrid layout collage from images in a directory',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python3 collage.py                    # Use current directory, output collage.jpg
  python3 collage.py /path/to/images    # Use specified directory
  python3 collage.py . my_collage.jpg   # Use current dir, custom output name
  python3 collage.py /photos output.jpg # Custom input dir and output name
        """
    )

    parser.add_argument(
        'input_dir',
        nargs='?',
        default=os.getcwd(),
        help='Directory containing images (default: current working directory)'
    )

    parser.add_argument(
        'output_file',
        nargs='?',
        default='collage.jpg',
        help='Output filename (default: collage.jpg)'
    )

    args = parser.parse_args()

    # Convert to absolute path
    input_path = Path(args.input_dir).resolve()

    if not input_path.exists():
        print(f"Error: Directory '{input_path}' does not exist")
        sys.exit(1)

    if not input_path.is_dir():
        print(f"Error: '{input_path}' is not a directory")
        sys.exit(1)

    # Output file path - if relative, place in current working directory
    output_path = args.output_file
    if not Path(output_path).is_absolute():
        output_path = Path.cwd() / output_path

    print(f"Creating collage from images in: {input_path}")
    print(f"Output will be saved as: {output_path}")

    # Create collage
    with CollageGenerator(str(input_path), str(output_path)) as generator:
        success = generator.create_collage()

        if success:
            print(f"\nSuccess! Collage saved as: {output_path}")
        else:
            print("\nFailed to create collage")

        sys.exit(0 if success else 1)

if __name__ == "__main__":
    main()

