#!/bin/sh

dir='/home/ry/keepass'
a="inotifywait -mrq -e move $dir"
b="/usr/bin/rsync -avz $dir/Passwords.kdbx ryan@ssh.rhellwege.xyz:/home/ryan/"
echo -e "establishing watches on /home/ry/keepass/" >> /tmp/rsync.log
$a | while read directory event file
    do
        if [ $event = "MOVED_TO" ]; then
            echo -e "\n\n\n\n==========================" >> /tmp/rsync.log
            echo -e "UPDATING PASSWORDS..." >> /tmp/rsync.log
            date >> /tmp/rsync.log
            echo $read $directory $event $file >> /tmp/rsync.log
            sleep 2
            echo -e "==========================" >> /tmp/rsync.log
            echo -e "\n\nuploading to rpi..." >> /tmp/rsync.log
            $b &>> /tmp/rsync.log
        fi
    done
