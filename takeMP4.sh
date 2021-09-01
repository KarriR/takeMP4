 #!/bin/bash

PREFIX="video"
CHAR="_"
CURRENTDATE=$(date +"%Y%m%d_%H%M%S")
FORMAT=".mp4"

duration="$1"
if [[ "$duration" = "" ]] 
then
duration="5000"
fi

echo "RECORDING..."
raspivid -o video.h264 -t "$duration"

echo "CONVERTING..."
output="${PREFIX}${CHAR}${CURRENTDATE}${FORMAT}"
MP4Box -add video.h264 "$output"
rm video.h264

echo "DONE!"


