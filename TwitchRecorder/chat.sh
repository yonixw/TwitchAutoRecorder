#!/bin/bash

counter=0
counter=$((counter+1))

echo [`date +%F-%T`] Starting chat loop for $USERNAME try $counter
while true
do
  # Appending to allow moving the file
  node chat.js >> ./inprogress/$id/chat_$counter.txt
  counter=$((counter+1))
  echo [`date +%F-%T`] Chat exited ...  next try $counter in 60s
  sleep 60s
done

