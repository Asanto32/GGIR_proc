import re
import openpyxl
import glob
import os

# Function to find the last instance of the pattern in the file
def find_last_instance(file_path, pattern):
    last_instance = None
    with open(file_path, 'r') as file:
        for line in file:
            if re.search(pattern, line):
                last_instance = line.strip()
    return last_instance

# Function to write lines to an Excel file in a new column for each file
def write_to_excel(instances, excel_file_path):
    # Create a workbook and select the active worksheet
    wb = openpyxl.Workbook()
    ws = wb.active
    
    # Write each file's last instance to a new column
    for col_index, instance in enumerate(instances, start=1):
        if instance:
            ws.cell(row=1, column=col_index, value=instance)
    
    # Save the workbook
    wb.save(excel_file_path)

# Directory containing the .out files
directory_path = '/ocean/projects/med220004p/shared/data_sandbox/ggir_proc/group1/logs'
# 
excel_file_path = '/ocean/projects/med220004p/shared/data_sandbox/ggir_proc/group1/logs/out_report.xlsx'
# Pattern to search for
pattern = r"File name: .*\.gt3x"

# List to hold the last instance from all files
last_instances = []

# Get a sorted list of all .out files in the directory
out_files = sorted(glob.glob(f'{directory_path}/*.out'))

# Loop over all sorted .out files
for file_path in out_files:
    #check for matching .err
    base_name = os.path.splitext(file_path)[0]
    err_file_path = f'{base_name}.err'
    if os.path.isfile(err_file_path):
       # Find the last instance of the pattern in the .out file
        last_instance = find_last_instance(file_path, pattern)
        last_instances.append(last_instance)


# Write those instances to an Excel file, each file's content in a new column
write_to_excel(last_instances, excel_file_path)