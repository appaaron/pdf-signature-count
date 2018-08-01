<#

Created By: Aaron Appelbaum
Created On: 3/5/2018
Last Modified:

Description: A PowerShell utility that reports on the number of digital signatures contained within each PDF file found in the directory path. 
The results will be written to a .csv file in the current users temp directory. After the .csv file is created, the application associated with opening .csv files (e.g. Excel),
 will launch and open the results. The CSV file is saved in the current users profile.

#>


#Set script location path to relative to where this script is located at.
$scriptpath = $MyInvocation.MyCommand.Path
$scriptpathFolder = Split-Path $scriptpath

Add-Type -Path "$scriptpathFolder\itextsharp.dll"; #iTextsharp a .Net port of the iText library. This dll is at version 5.5.13
Add-Type -AssemblyName System.Windows.Forms; #for user folder dialog

#Create array to populate with output to a CSV.
$OutputList= @();

#Prompt the user for the path to search PDF files.
$selectDirectory=New-Object System.Windows.Forms.FolderBrowserDialog;
$selectDirectory.Description = "Select the folder that contains PDFs to check for signature counts. All subfolders underneath this folder will also be searched.";
$selectDirectory.RootFolder = "MyComputer";
$selectDirectory.D

if($selectDirectory.ShowDialog() -eq "OK")
{
    $SourceDirectory = $selectDirectory.SelectedPath;
    $FileList = Get-ChildItem -Path $SourceDirectory -Recurse -Include *.pdf;
    $numofPDFFiles = $FileList.Count

    #Only run the signature check if at least one PDFs is found.
    if($numofPDFFiles -gt 0)
    {
        #STEP 1: Process each .PDF by by writing the number of signatures, and additional file metadata to the array.
        ForEach ($File in $FileList)
        {
            $pdfReader = New-Object iTextSharp.text.pdf.PdfReader ($File.ToString());
            $numofSig = $pdfReader.AcroFields.GetSignatureNames().Count;
            $item = New-Object PSObject;
            $item | Add-Member -type NoteProperty -Name 'FileName' -Value $File.Name;
            $item | Add-Member -type NoteProperty -Name 'FullName' -Value $File.FullName;
            $item | Add-Member -type NoteProperty -Name 'SignatureCount' -Value $numofSig;
            $OutputList += $item;
            Write-Host "Processing" $File.FullName;
        }

        #STEP 2: Export the results to a CSV and then open that file up in Excel
        $exportFile = "PDF Signature Check - " + [datetime]::Now.ToString('hh-mm-ss-fff') + ".csv";
        $OutputList | Export-Csv $env:TMP\$exportFile  -notypeinformation;
        Invoke-Item $env:TMP\$exportFile;
    }
    #Run this is no PDFs are found.
    Else
    {
        [System.Windows.Forms.MessageBox]::Show("This directory does not contain any PDF files. Please try again.", "No Files Found") ;
     }
}
