#!/bin/bash

# The directory to search in
SEARCH_DIR="/ocean/projects/med220004p/shared/data_sandbox/ggir_proc/group1/"

# The name of the resulting zip file
ZIP_FILE="gt3x_data_archive.zip"

# Find all files with the specified pattern and zip them
find "$SEARCH_DIR" -type f -name "*.gt3x.RData.csv" -print | zip $ZIP_FILE -@

echo "All matching files have been zipped into $ZIP_FILE"