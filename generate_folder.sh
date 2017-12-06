#!/bin/bash

generate_files_in_folder() {
	folder_path=$1
	iteration=$2
	for i in `seq 1 1000`;
	do
	   touch "$folder_path/${iteration}abcdefghijklmnopqrstuvwxyz$i.swift"
	done
}

folder_path='test'
mkdir "$folder_path"
for i in `seq 1 3`;
do
   folder_path="$folder_path/$i"
   mkdir "$folder_path"
   echo "$i"
   generate_files_in_folder "$folder_path" "$i"
done