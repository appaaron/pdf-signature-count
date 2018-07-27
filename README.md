Project Title
A PowerShell utility that will return all PDFs in directory path along with the count of signatures contained within each PDF file find. The results will be saved to a .csv file. The primary purpose of this tool is for looking at PDFs that should be signed to verify that at least one signature is counted in each file.

After the .csv file is created, the application associated with opening .csv files (e.g. Excel), will launch and open the results. The CSV file is saved in the current users profile.

Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

Prerequisites
Tested on Windows 10 64-bit OS w/ builtin Powershell version 5.


Installing
1. Download the two files in the files library to the same location on your computer.
2. Run the pdf-signature-count.ps1 file in PowerShell. You may be prompted to allow the script to run. Choose "Yes" if prompted.
3. Choose a folder to look for PDFs. All pdfs found in this folder and all subfolders will be searched for signatures.

Built With
PowerShell
iText

Contributing
Please read CONTRIBUTING.md for details on our code of conduct, and the process for submitting pull requests to us.

Authors
Aaron Appelbaum - Initial work

License
This project is licensed under the MIT License - see the LICENSE.md file for details

Acknowledgments
iText | iTextSharp for the PDF library.
