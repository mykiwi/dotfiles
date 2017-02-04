#!/bin/bash

find . -maxdepth 1 -type f \( -name ".*" ! -iname ".git" ! -iname ".gitignore" ! -iname ".gitmodules" -print0 \) | while IFS= read -r -d $'\0' f; do
    file=`echo $f | cut -c 3-`
    ln -s `pwd`/$file ~/$file
done
