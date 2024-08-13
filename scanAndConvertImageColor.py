from PIL import Image
import os
import sys

def convert_cmyk_to_rgb(image_path):
    image = Image.open(image_path)

    if image.mode == 'CMYK':
        image = image.convert('RGB')
        print("Image mode after conversion: ", image.mode)

        # Get the original directory and file name
        directory, filename = os.path.split(image_path)
        output_path = os.path.join(directory, filename)

        # Save the image over the original path
        image.save(output_path)

        return True  # Return True if conversion is successful
    else:
        return False  # Return False if no conversion is needed

def process_directory(directory):
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.lower().endswith(('.png', '.jpg')):
                file_path = os.path.join(root, file)
                if convert_cmyk_to_rgb(file_path):
                    print("Converted:", file_path)
                else:
                    print("No conversion needed for:", file_path)

if len(sys.argv) < 2:
    print("Usage: python imgColorConverter.py <parent_directory>")
else:
    parent_directory = sys.argv[1]
    process_directory(parent_directory)
