
import subprocess
import openpyxl
import glob

# Function to get the last N lines of the error file
def get_last_n_lines(file_path, n):
    command = ['tail', '-n', str(n), file_path]
    result = subprocess.run(command, stdout=subprocess.PIPE, text=True)
    return result.stdout.strip().split('\n')

# Function to write lines to an Excel file in a new column for each file
def write_to_excel(lines_list, excel_file_path):
    # Create a workbook and select the active worksheet
    wb = openpyxl.Workbook()
    ws = wb.active
    
    # Write each file's lines to a new column
    for col_index, lines in enumerate(lines_list, start=1):
        for row_index, line in enumerate(lines, start=1):
            cell = ws.cell(row=row_index, column=col_index)
            cell.value = line
    
    # Save the workbook
    wb.save(excel_file_path)

#main part
# Directory containing the .err files
directory_path = '/ocean/projects/med220004p/shared/data_sandbox/ggir_proc/group1/logs'
# 
excel_file_path = '/ocean/projects/med220004p/shared/data_sandbox/ggir_proc/group1/logs/err_report.xlsx'
# define N number of lines to keep
N = 7

# List to hold lines from all files
all_lines = []

#get sorted list
err_files = sorted(glob.glob(f'{directory_path}/*.err'))

# Loop over all sorted .err files
for file_path in err_files:
    # Get the last N lines from the .err file
    lines = get_last_n_lines(file_path, N)
    all_lines.append(lines)

# Write those lines to an Excel file, each file's content in a new column
write_to_excel(all_lines, excel_file_path)
