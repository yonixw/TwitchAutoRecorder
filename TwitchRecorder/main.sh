#!/bin/bash

#id = time+random(1000,9999)
export id=`date +%s`_`shuf -i 1000-9999 -n 1`
mkdir -p ./inprogress/$id

echo [`date +%F-%T`] ENV: Username $USERNAME, Quality: $QUALITY, record id: $id


export status="$(youtube-dl -F http://www.twitch.tv/$USERNAME 2>&1 >/dev/null | grep --color offline)"
while [[ $status =~ "offline|HTTPError" ]]
do
    echo [`date +%F-%T`] Offline, waiting 5m
    sleep 5m
    status="$(youtube-dl -F http://www.twitch.tv/$USERNAME 2>&1 >/dev/null | grep --color offline)"
done

#Show available formats:
youtube-dl -F http://www.twitch.tv/$USERNAME

echo [`date +%F-%T`] Starting chat process.
bash chat.sh &

echo [`date +%F-%T`] Downloading video
youtube-dl https://www.twitch.tv/$USERNAME -q -f "$QUALITY" --output "./inprogress/$id/%(timestamp)s_%(resolution)s.%(ext)s" --no-cache-dir >> ./inprogress/$id/download_log.txt

echo [`date +%F-%T`] Moving results
mv ./inprogress/$id ./allrecords

echo [`date +%F-%T`] Video download stopped. Stopping.

echo [`date +%F-%T`] Before restart, wait 5m
sleep 5m
