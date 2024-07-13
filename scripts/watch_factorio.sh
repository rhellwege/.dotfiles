#!/bin/sh

dir='/home/ry/Games/factorio/saves'
a="inotifywait -mrq -e delete $dir"
b="/usr/bin/rsync -avz $dir/alia.zip ryan@ssh.rhellwege.xyz:/home/ryan/"
echo -e "establishing watches on /home/ry/Games/factorio/saves/" >> /tmp/rsync.log
$a | while read directory event file
    do
        echo $event
        if [ "$event" = "DELETE" ]; then
            sleep 2
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
