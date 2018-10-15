#!/bin/bash

cd credentials
. ./credentials.sh
cd ..

cd run-dir
rm *.tf
cd ..

for DIR in terraform/*; do
	for FILE in $DIR/*; do
		cp $FILE run-dir
	done
done

cp init.tf run-dir
cd run-dir