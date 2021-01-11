#requires -Version 5.1
#requires -PSEdition Desktop

function GetVersionNumber {
    $output = $null
    do {
        $output = Read-Host 'What is the current version?'
    }
    while (!$output)
    return $output
}

function ZipFiles {
    param($filesDirectory, $docsDirectory, $versionData)
    $docsOutput = "lab_instructions-v" + $versionData + ".zip"
    Compress-Archive -Path ($docsDirectory + "*.docx") -DestinationPath $docsOutput
}

function AddVersionFooter {
    param($file, $versionData)
    $filePath = (Resolve-Path $file).Path
    $Word = New-Object -ComObject Word.Application
    $Doc = $Word.Documents.Open($filePath)
    $Section = $Doc.Sections.Item(1)
    $Footer = $Section.Footers.Item(1)
    $Footer.Range.Text = "Version: " + $versionData
    $Doc.Save()
    $Doc.Close()
}

function ConvertMarkdownToWord {
    param($inputFile, $outputFile, $versionData)
    pandoc $inputFile -o $outputFile --reference-doc=template.docx 
    AddVersionFooter $outputFile $versionData
}

$docsInputDirectory = "..\Instructions\"
$outputDirectory = "Temp\"
$docsOutputDirectory = $outputDirectory + "Lab Instructions\"

$version = GetVersionNumber

' Create Temp Directory'
New-Item -ItemType Directory -Force -Path $docsOutputDirectory | Out-Null

' Create Lab Word Documents'
foreach ($file in Get-ChildItem $docsInputDirectory | Where-Object { $_.Extension -eq ".md" }) {
    $inputFile = $docsInputDirectory + $file.Name;
    $outputFile = $docsOutputDirectory + $file.BaseName + '.docx'
    ConvertMarkdownToWord $inputFile $outputFile $version
}


#' Copy AllFiles '
#Copy-Item $filesInputDirectory –Destination $outputDirectory -Recurse -Container

' Compress Lab Instructions '
ZipFiles $filesOutputDirectory $docsOutputDirectory $version

' Remove Temp Directory'
Remove-Item $outputDirectory -Force -Recurse