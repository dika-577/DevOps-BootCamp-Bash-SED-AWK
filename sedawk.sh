#!/bin/bash

# Put you code here
orig_file="./passwd"
dest_file="./passwd_new"
 
 cp $orig_file $dest_file

    awk  -F: 'BEGIN{OFS=":"}/saned/{$7="/bin/bash"};{print}' $dest_file > temp && mv temp $dest_file 
      sed  -i '/^avahi/s,usr/sbin/nologin,bin/bash,' $dest_file
      awk -F: 'BEGIN{OFS=":"}{print $1 ":" $3 ":" $5 ":" $7}' $dest_file  > temp && mv temp $dest_file 
      sed  '/daemon/Id' $dest_file > temp && mv temp $dest_file
      awk -F: '($2 % 2 == 0) { $2="/bin/zsh" } { print }'  $dest_file > temp && mv temp $dest_file 
