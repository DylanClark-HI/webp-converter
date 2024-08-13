#!/bin/bash

convert_images() {
    for file in "$1"/*; do
        if [ -d "$file" ]; then
            convert_images "$file"  # Recursive call for subdirectories
        elif [ -f "$file" ] && (echo "$file" | grep -E '\.jpg$|\.png$' > /dev/null); then
            if [ -r "$file" ]; then
                base=$(basename "$file")
                fname="${base%.*}"
                ext="${base##*.}"
echo "$dirname"
                cwebp -q 80 "$file" -o "$(dirname "$file")/$fname.webp"  # Convert JPG to WebP
            else
                echo "Permission denied for $file. Skipping..."
            fi
        fi
    done
}

echo "Hey there. This program requires the webp package to be installed."
read -p "Do you have it? [Y/N] " an1
case "$an1" in
    y|Y)
        echo " "
        read -p "Where are your images located? Provide folder: " dir
        if [ -d "$dir" ]; then
            convert_images "$dir"
        else
            echo "Directory does not exist. Please provide a valid folder."
        fi
        ;;
    n|N)
        echo "You need to install the webp package to use this script."
        ;;
    *)
        tput setaf 1; echo -e "\nPlease provide a 'Y' (for yes) or 'N' (for no)."
        ;;
esac
