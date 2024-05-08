temp_file="/tmp/screenshot.png"
flameshot gui -r > $temp_file

if [[ $(file --mime-type -b $temp_file) != "image/png" ]]; then
    rm $temp_file
    exit 1
fi

image_url=$(pomfload $temp_file)
echo $image_url > /tmp/upload.json
response_file="/tmp/upload.json"

if [ -z "$(cat $response_file)" ]; then
    notify-send "Error occurred while uploading. Please try again later." -a "Flameshot"
    rm $temp_file
    rm $response_file
    exit 1
fi

cat /tmp/upload.json | xclip -sel c
notify-send "Image URL copied to clipboard" -a "Flameshot" -i $temp_file
rm $temp_file
