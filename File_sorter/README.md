## Automated File Processor for Dental Lab Workflow

This Python script automates the organization, renaming, and sorting of dental CAD/CAM files based on their names and types. It continuously monitors a check-in folder for new files and handles them according to specific logic rules. This is useful in a dental lab environment where incoming files need to be correctly sorted for printing, modeling, tissue processing, or general case management.
---

## Folder Structure (Set your actual paths):

- checkin_folder_path: Monitored folder where new files are placed.
- source_folder_path: Working area where files are temporarily staged.
- target_folder_path: Final destination for cleaned and renamed files.
- sort_folder_path: For files that don’t follow naming conventions.
- print_folder_path: For files related to printing (e.g., tooth, model).
- tissue_folder_path: For tissue-related files.
- model_folder_path: For model-related files (antag, sectioned, unsectioned, etc.).
---

## What the Script Does:

- Monitors the checkin_folder_path in a loop.
- Moves any found files or directories into the source_folder_path.
- Cleans up empty subdirectories afterward.
- Filters and sorts files in source_folder_path:
- If filename contains: antag, model, tooth, tissue, solodie → move to print_folder_path.
- If .xml → delete.
- If filename contains "ImplantDirectionPosition_*", "BottomScrewHole", or "TopScrewHole" → delete.

---

## Handles file renaming:

- Strips parentheses/bracketed text from the filename.
- Attempts to reformat filenames like:
- AB_123_XYZ_456.ext → AB_123_456_XYZ.ext
- If renaming fails (due to unexpected format) → move to sort_folder_path.
- Final Sorting in print_folder_path:
- Files with "tissue" → move to tissue_folder_path.Files with unsectioned, antag, tooth, or sectioned → move to model_folder_path.

---

## Handles file collisions:

-If renamed file already exists **>** moves to the sort folder instead of overwriting.
-Waits 1 second and loops.
-Runs indefinitely until manually stopped (Ctrl+C).

---

## Technologies & Dependencies:

Python standard libraries: os, shutil, time, re.

---

## Known Limitations:

- Hardcoded paths – Must be updated manually.
- Filename logic is fragile – Depends heavily on consistent file naming conventions.
- No logging – Only prints to console. 
- No concurrency – Blocking logic could slow if dealing with large numbers of files.

---

## Ideal Use Case:

Used in a dental lab production environment to automate sorting of 3D model files and reduce human error in organizing digital impressions, model data, and surgical planning files. 