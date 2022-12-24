#!/bin/bash

# Put you code here
orig_file="./passwd"
dest_file="./passwd_new"

# Create copy of passwd file to passwd_new
cp $orig_file $dest_file

  #Change shell for user saned from /usr/sbin/nologin to /bin/bash using AWK
  awk  -F: 'BEGIN{OFS=":"}/saned/{$7="/bin/bash"};{print}' $dest_file > temp && mv temp $dest_file
  # Change shell for user avahi from /usr/sbin/nologin to /bin/bash using SED
  sed  -i '/^avahi/s,usr/sbin/nologin,bin/bash,' $dest_file
  #Save only 1-st 3-th 5-th 7-th columns of each string based on : delimiter
  awk -F: 'BEGIN{OFS=":"}{print $1 ":" $3 ":" $5 ":" $7}' $dest_file  > temp && mv temp $dest_file
  #Remove all lines from file containing word daemon 
  sed  '/daemon/Id' $dest_file > temp && mv temp $dest_file
  #Change shell for all users with even UID to /bin/zsh
  awk -F: '($2 % 2 == 0) { $2="/bin/zsh" } { print }'  $dest_file > temp && mv temp $dest_file 
