#!/usr/bin/env python3
import sys
import os
import subprocess
from pathlib import Path

def convert_to_mp4(input_file, output_file=None):
    """Convert a video file to MP4 format using ffmpeg."""

    # Check if input file exists
    if not os.path.exists(input_file):
        print(f"Error: Input file '{input_file}' not found.")
        return False

    # Generate output filename if not provided
    if output_file is None:
        input_path = Path(input_file)
        output_file = input_path.with_suffix('.mp4')

    # Check if ffmpeg is available
    try:
        subprocess.run(['ffmpeg', '-version'], capture_output=True, check=True)
    except (subprocess.CalledProcessError, FileNotFoundError):
        print("Error: ffmpeg is not installed or not found in PATH.")
        print("Please install ffmpeg: https://ffmpeg.org/download.html")
        return False

    # Build ffmpeg command
    cmd = [
        'ffmpeg',
        '-i', input_file,
        '-c:v', 'libx264',  # Video codec
        '-c:a', 'aac',      # Audio codec
        '-preset', 'medium', # Encoding speed/quality balance
        '-crf', '23',       # Quality (lower = better quality)
        '-y',               # Overwrite output file if it exists
        str(output_file)
    ]

    print(f"Converting '{input_file}' to '{output_file}'...")

    try:
        # Run ffmpeg conversion
        result = subprocess.run(cmd, capture_output=True, text=True)

        if result.returncode == 0:
            print(f"✓ Conversion successful: {output_file}")
            return True
        else:
            print(f"✗ Conversion failed:")
            print(result.stderr)
            return False

    except Exception as e:
        print(f"Error during conversion: {e}")
        return False

def main():
    if len(sys.argv) < 2:
        print("Usage: python video_converter.py <input_video> [output_video.mp4]")
        print("Example: python video_converter.py video.avi")
        print("Example: python video_converter.py video.mov output.mp4")
        sys.exit(1)

    input_file = sys.argv[1]
    output_file = sys.argv[2] if len(sys.argv) > 2 else None

    success = convert_to_mp4(input_file, output_file)
    sys.exit(0 if success else 1)

if __name__ == "__main__":
    main()