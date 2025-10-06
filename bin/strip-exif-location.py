#!/usr/bin/env python3
"""
Strip GPS/location EXIF data from all JPEG images in current directory.
"""
import os
from pathlib import Path

try:
    from PIL import Image
    from PIL.ExifTags import TAGS
except ImportError:
    print("Error: Pillow library required. Install with: pip install Pillow")
    exit(1)


def strip_location_exif(image_path):
    """Remove GPS/location EXIF data from a JPEG image."""
    try:
        img = Image.open(image_path)

        # Check if image has EXIF data
        exif = img.getexif()
        if not exif:
            print(f"No EXIF data found in {image_path}")
            return False

        # Find and remove GPS IFD (tag 34853)
        gps_ifd_tag = None
        for tag, name in TAGS.items():
            if name == "GPSInfo":
                gps_ifd_tag = tag
                break

        # Create new EXIF without GPS data
        modified = False
        if gps_ifd_tag and gps_ifd_tag in exif:
            del exif[gps_ifd_tag]
            modified = True

        if modified:
            # Save image with cleaned EXIF
            img.save(image_path, exif=exif, quality=95, optimize=True)
            print(f"✓ Stripped location data from {image_path}")
            return True
        else:
            print(f"No GPS data found in {image_path}")
            return False

    except Exception as e:
        print(f"Error processing {image_path}: {e}")
        return False


def main():
    # Find all JPEG files in current directory
    current_dir = Path.cwd()
    jpeg_files = list(current_dir.glob("*.jpg")) + list(current_dir.glob("*.jpeg")) + \
                 list(current_dir.glob("*.JPG")) + list(current_dir.glob("*.JPEG"))

    if not jpeg_files:
        print("No JPEG files found in current directory")
        return

    print(f"Found {len(jpeg_files)} JPEG file(s)\n")

    success_count = 0
    for image_path in jpeg_files:
        if strip_location_exif(image_path):
            success_count += 1

    print(f"\nProcessed {len(jpeg_files)} file(s), {success_count} modified")


if __name__ == "__main__":
    main()
