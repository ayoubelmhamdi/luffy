#!/bin/bash


for file in *;do
    if [[ ! -L $file ]];then
        echo $file
        cat ll.txt >> $file
    fi
done
