#!/bin/bash
# Tool to download images from a given text file which contains urls
# Uses httpie: https://github.com/jakubroztocil/httpie

echo "Downloading all images in file: $1..."
for URL in `cat $1`
do
  echo "Downloading url: $URL..."
  http -d $URL
done