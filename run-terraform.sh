#!/bin/bash

# Resets the directory where terraform will run, i.e. run-dir
if [ ! -d "run-dir" ]; then # If the run-dir doesn't exist, create it
  	mkdir run-dir
else # Else, delete all .tf files
  	cd run-dir
  	rm *.tf
  	cd ..
fi

# =====================================================
# Goes through all .tf files in the terraform directory, 
# copies and renames them by concatenating the dirname with filename, 
# and spits them into the run-dir.
#
# For example, the original file in the terraform folder, 
# isomer_gov_sg/aws_cdn.tf will be renamed as isomer_gov_sg_aws_cdn.tf
# =====================================================

for DIR in terraform/*; do
	DIRNAME=$(basename $DIR)
	for FILE in $DIR/*; do
		FILENAME=$(basename $FILE)
		cp $FILE run-dir/${DIRNAME}_${FILENAME}
	done
done

# Move the terraform binary into the run-dir
cp bin/terraform run-dir

# Initialize terraform config
cp init.tf run-dir