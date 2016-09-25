#backup configs
#!bin/bash
echo "rsync backup started. Ensure appropriate drives are correctly setup." | mail -v -s "rsync backup started." nravic@protonmail.ch > /dev/null 2>&1
sleep 30

if mountpoint /media/Elements
then
    rsync -a --delete /home/scire/files /media/Elements/backups/files
    rsync -a --delete /home/scire/programs /media/Elements/backups/programs
    rsync -a --delete /home/scire/.config /media/Elements/backups/configs
    rsync -a --delete /home/scire/.emacs.d /media/Elements/backups/configs
    rsync -a  /home/scire/.emacs /media/Elements/backups/configs
    echo "backing configs and files with rsync."
else
    echo "backup failed, drives not connected."
fi

