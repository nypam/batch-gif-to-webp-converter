# 🖼️ GIF to WebP Converter

A Bash script to recursively find and convert animated GIFs to WebP format using FFmpeg on macOS. Supports adjustable compression quality and resizing.

## 📌 Prerequisites
Ensure you have [FFmpeg](https://ffmpeg.org/) installed. If you haven't installed it yet, use Homebrew:

```sh
brew install ffmpeg
```

## 🔧 Installation
1. Clone this repository or download the script.
2. Give the script executable permissions:
   ```sh
   chmod +x convert_gif_to_webp.sh
   ```

## 🚀 Usage
```sh
./convert_gif_to_webp.sh -d <directory> [-q <quality>] [-s <scale>]
```

### Options
- `-d` → Directory containing GIFs (Required)
- `-q` → WebP quality (default: `80`, range: `0-100`)
- `-s` → Scale percentage (default: `100`, range: `1-100`)

## 📌 Examples
### Convert GIFs in a folder with default settings
```sh
./convert_gif_to_webp.sh -d /Users/adam/Pictures/GIFs
```

### Convert GIFs with 70% quality and 60% scale
```sh
./convert_gif_to_webp.sh -d /Users/adam/Pictures/GIFs -q 70 -s 60
```

### Convert GIFs with max quality and full size
```sh
./convert_gif_to_webp.sh -d /Users/adam/Pictures/GIFs -q 100 -s 100
```

## ✅ Output Format
The script replaces `.gif` with `.webp` and stores it in the same directory:
```
/Users/adam/Pictures/GIFs/animation.gif → animation.webp
/Users/adam/Pictures/GIFs/subfolder/cool.gif → cool.webp
```

## 🛠️ Troubleshooting
- Ensure FFmpeg is installed (`ffmpeg -version` to check).
- Run the script with `sudo` if there are permission issues.
- Make sure the input directory exists and contains GIFs.

## 📜 License
This script is open-source and available under the MIT License.

