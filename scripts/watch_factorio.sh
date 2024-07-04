#!/bin/sh

dir='/home/ry/Games/factorio/saves/'
a="inotifywait -mq -e delete $dir"
b="/usr/bin/rsync -avz $dir/alia.zip ryan@ssh.rhellwege.xyz:/home/ryan/"
$a | while read directory event file
    do
        echo $event
        if [ "$event" = "DELETE" ]; then
            echo -e "updating alia.zip..." >> /tmp/rsync.log
            echo -e "\n\n\n\n==========================" >> /tmp/rsync.log
            echo -e "UPDATING FACTORIO SAVE..." >> /tmp/rsync.log
            date >> /tmp/rsync.log
            echo $read $directory $event $file >> /tmp/rsync.log
            echo -e "==========================" >> /tmp/rsync.log
            echo -e "\n\nuploading to rpi..." >> /tmp/rsync.log
            $b &>> /tmp/rsync.log
            echo -e "==========================" >> /tmp/rsync.log
        fi
    done
