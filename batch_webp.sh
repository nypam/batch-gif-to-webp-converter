#!/bin/bash

# Default quality and scale
QUALITY=80
SCALE=100

# Function to show usage
usage() {
    echo "Usage: $0 -d <directory> [-q <quality>] [-s <scale>]"
    echo "  -d  Directory containing GIFs"
    echo "  -q  Quality (default: 80, range: 0-100)"
    echo "  -s  Scale percentage (default: 100, range: 1-100)"
    exit 1
}

# Parse options
while getopts "d:q:s:" opt; do
  case $opt in
    d) DIRECTORY="$OPTARG" ;;
    q) QUALITY="$OPTARG" ;;
    s) SCALE="$OPTARG" ;;
    *) usage ;;
  esac
done

# Validate directory input
if [[ -z "$DIRECTORY" || ! -d "$DIRECTORY" ]]; then
    echo "Error: Valid directory required."
    usage
fi

# Validate quality
if ! [[ "$QUALITY" =~ ^[0-9]+$ ]] || ((QUALITY < 0 || QUALITY > 100)); then
    echo "Error: Quality must be between 0 and 100."
    usage
fi

# Validate scale
if ! [[ "$SCALE" =~ ^[0-9]+$ ]] || ((SCALE < 1 || SCALE > 100)); then
    echo "Error: Scale must be between 1 and 100."
    usage
fi

# Convert GIFs to WebP
find "$DIRECTORY" -type f -iname "*.gif" | while read -r file; do
    OUTPUT="${file%.gif}.webp"
    echo "Converting: $file -> $OUTPUT"
    ffmpeg -y -i "$file" -vf "scale=iw*$SCALE/100:ih*$SCALE/100" -quality "$QUALITY" "$OUTPUT"
done

echo "✅ Conversion complete!"
