#!/bin/bash

if [ ! -d "run-dir" ]; then
  	mkdir run-dir
else
  	cd run-dir
  	rm *.tf
  	cd ..
fi

for DIR in terraform/*; do
	DIRNAME=$(basename $DIR)
	for FILE in $DIR/*; do
		FILENAME=$(basename $FILE)
		cp $FILE run-dir/${DIRNAME}_${FILENAME}
	done
done

cp bin/terraform run-dir

cp init.tf run-dir