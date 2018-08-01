# **PDF DIGITAL SIGNATURE COUNT**

A PowerShell utility that reports on the number of digital signatures contained within each PDF file found in the directory path. The results are written to a .csv file. After the .csv file is created, the application associated with opening .csv files (e.g. Excel), will launch and open the results. The CSV file is saved in the current users profile.

# **Getting Started**

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

## **Prerequisites**

Tested on Windows 10 64-bit OS w/ builtin Powershell version 5. This should work on other versions of Windows that have
a modern version of PowerShell installed.  

## **Installing**

1. Download the two files in the ./files folder to the same location on your computer.
2. Run the pdf-signature-count.ps1 file in PowerShell. You may be prompted to allow the script to run. Choose "Yes" if prompted.
3. Choose a folder to look for PDFs. All pdfs found in this folder and all any subfolders will be searched for signatures.

# **Built With**

- PowerShell
- itextsharp (https://github.com/itext/itextsharp)

# **Contributing**

Please read CONTRIBUTING.md for details on our code of conduct, and the process for submitting pull requests to us.

# **Authors**

Aaron Appelbaum - Initial work

# **License**

This project is licensed under the MIT License - see the LICENSE.md file for details

# **Acknowledgments**

iText | iTextSharp for the PDF library.
