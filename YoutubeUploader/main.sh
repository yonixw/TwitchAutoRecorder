#!/bin/bash

while true
    do

    files="./allrecords/*/*.mp4"

    for f in $files
    do
        name=$(basename $f)
        echo [`date +%F-%T`] File $name
        youtube-upload --client-secrets=/src/app/.client_secrets.json --title="$name" --privacy private $f
        rm -f $f
    done

    echo [`date +%F-%T`] Done uploading, waiting 5m
    sleep 5m
done


