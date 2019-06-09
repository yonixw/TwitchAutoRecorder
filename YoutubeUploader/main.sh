#!/bin/bash

while true
    do

    files="./allrecords/*/*.mp4"

    for f in $files
    do
        if [[ -f "$f" ]]; then
            echo "$f exist"
            name=$(basename $f)
            echo [`date +%F-%T`] File $name
            youtube-upload --client-secrets=/src/app/.client_secrets.json --title="$name" --privacy private $f
            
            echo [`date +%F-%T`] Done uploading $f, waiting 20m before next
            sleep 20m
            # rm -f $f
        fi
    done

    echo [`date +%F-%T`] Done uploading, waiting 5m
    sleep 5m
done


