import os

def rename_stl_files(folder_path):
    # List all files in the folder
    files = os.listdir(folder_path)

    # Iterate through each file
    for filename in files:
        # Check if the file is an STL file
        if filename.lower().endswith('.stl'):
            # Split the filename and extension
            name, ext = os.path.splitext(filename)
            # Form the new filename with "A1" suffixed
            new_filename = name + "_A1" + ext #Changed this for the different shades.
            # Rename the file
            os.rename(os.path.join(folder_path, filename), os.path.join(folder_path, new_filename))
            print(f"Renamed {filename} to {new_filename}")

# Specify the folder path containing the STL files
folder_path = 'C:\\full\\folder\\path\\name'

# Call the function to rename STL files
rename_stl_files(folder_path)
w