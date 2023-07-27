# csv-url-checker
Checks urls for a 404 error from a CSV file and outputs a new CSV file with a "valid" column

#use:

To use the script, cd in your PowerShell to the folder where the script is located.
You call the script with the following command: .\Check-URL.ps1 "PATH_TO_INPUT_CSV_FILE"

For example:

If your script is located in C:\Desktop\ and the input file is called short-100.csv and is also located in C:\Desktop,
you would use commands in the following order: 

1. 'cd C:\Desktop"
2. '.\Check-URL.ps1 "./short-100.csv"

The script will then output a file named "CheckURL-export.csv"

The execution time can be in the range of hours and even days, depending on the size of the input table.
