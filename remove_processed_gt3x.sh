#!/bin/bash

# Base directory containing sub_dir1 through sub_dirYY
base_dir="/ocean/projects/med220004p/shared/data_sandbox/ggir_proc/group1"

# Loop through each subdirectory in the base directory
for sub_dir in "$base_dir"/subdir_*; do
  # Check if the directory name matches the pattern
  if [[ -d $sub_dir ]]; then
    # Change to the subdirectory
    cd "$sub_dir" || exit

    # Loop through each .gt3x file in the subdirectory
    for gt3x_file in *.gt3x; do
      # Check if the output directory for the .gt3x file exists
      if [[ -d "output_${gt3x_file%.gt3x}" ]]; then
        # Remove the .gt3x file
        rm "$gt3x_file"
      fi
    done

    # Change back to the base directory
    cd "$base_dir" || exit
  fi
done








