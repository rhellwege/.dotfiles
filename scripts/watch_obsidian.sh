#!/bin/sh

dir='/home/ry/Vault'
a="inotifywait -mrq -e modify,move,create,delete $dir"
b="/usr/bin/rsync -avz $dir ryan@ssh.rhellwege.xyz:/home/ryan/ --delete"
c="/usr/bin/rsync -avz $dir mobile@192.168.6.39:/private/var/mobile/Containers/Data/Application/06299A78-B86A-4157-975D-A07DB92714D0/Documents/ --delete"
$a | while read directory event file
    do
        echo -e "\n\n\n\n==========================" >> /tmp/rsync.log
        date >> /tmp/rsync.log
        echo $read $directory $event $file >> /tmp/rsync.log
        echo -e "==========================" >> /tmp/rsync.log
        echo -e "\n\nuploading to rpi..." >> /tmp/rsync.log
        $b &>> /tmp/rsync.log
        echo -e "\n\nuploading to ipad..." >> /tmp/rsync.log
        $c &>> /tmp/rsync.log
        echo -e "==========================" >> /tmp/rsync.log
    done
