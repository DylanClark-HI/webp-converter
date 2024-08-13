# webp-converter
WORK IN PROGRESS
A hacky bash script that uses cwebp to handle bulk converting of jpg and png images. Also has a python script to handle changing of image colors from 'CMYK' to 'RGB' before running the webp conversion. The bash script loops through parent and child directories and creates webp versions of any jpg and png images. Retains names and folder structures.

Do not alter the files or folders in any other way. 
    - Create formatted copies of the images
    - Retain the same file / folder name
    - Retain folder structure

# Reasons:
  - Had a few occasions where we needed to bulk convert images to webp
  - Didn't want to install more junk on my work laptop (image converters and what not)
  - Give my Raspberry Pi a reason for it's existance

# Approach:
  - Copy files and folders from my laptop to the Pi with SCP (local network)
  - SSH into the Pi
  - Execute the Bash script
    -- If there are errors relating to iage colors, you can use the python script ******Add to this
    Loop through the directories and convert and jpg or png images to webp format. 

