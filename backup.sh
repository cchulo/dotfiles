#!/bin/sh

# Credit: https://chandujs.dev/blog/backup-your-dotfiles-with-a-simple-bash-script-5hn2/

# This script copy files mentioned inside `backup.conf` to the root of the project.

# file to look for the paths to backup.
backupPaths="./backup.conf"
# home directory path.
homeDirectory=~

echo "Clearing configurations directory..."
# removing the folder with exsiting contents. we have git version anyway!
rm -rf configurations
# creating it again for backup.
mkdir configurations
sleep 1
echo -e "Configurations directory cleared."
sleep 1

echo -e "Starting backup..."
sleep 1

# looping through the list & avoiding the empty spaces
sed '/^[ \t]*$/d' $backupPaths | while read filePath; do
  echo -e "Copying: $filePath"

  # find & replace for ~ with home path
  findThis="~/"
  replaceWith="$homeDirectory/"
  originalFile="${filePath//${findThis}/${replaceWith}}"

  # copying the files
  cp --parents --recursive $originalFile ./configurations
  sleep 0.05
done

git add .

echo -e "Backup finished! You can review & commit your changes."

