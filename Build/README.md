#Building the course

> It is **strongly** recommended that you use the released files for instructor-led or online deliveries.

## Prerequisites

* Pandoc 1.19.2
* PowerShell Community Extensions 3.2.2

> For some scenarios, you may need to reboot your machine or log off after installing the two prerequisites. This manual build has only been tested with the above versions of each dependency.

## Manual Builds
A PowerShell script is included that will build the course and output two zip files, one for the **AllFiles** and one for the **Lab Instructions**.  The script will initially prompt you for a version number and that version number is used in the name of the resulting zip files.  Both prerequisites must be installed prior to running the script.

> If you are new to PowerShell, you may need to set the execution policy of remote scripts on your machine.  More details can be found here [TechNet: Using the Set-ExecutionPolicy Cmdlet](https://technet.microsoft.com/en-us/library/ee176961.aspx)



### Installing Pandoc version 1.19.2

Pandoc is a tool that you can use to convert files from one format to another. It can read many formats, including GFM, and you use it output Microsoft Word's .docx format. Pandoc is the tool behind the scripts that Microsoft Learning provides to create Word documents from the Markdown file format of the lab files. If you do not install Pandoc, the document-creation script fails.

To install Pandoc, perform the following steps:

1.  In your browser, navigate to [https://GitHub.com/jgm/pandoc/releases](https://github.com/jgm/pandoc/releases/tag/1.19.2).
2.  Click **pandoc-1.19.2-windows.msi**.
3.  When the **pandoc-1.19.2-windows.msi** file has downloaded, double-click the file to start the setup, or click **Run** if you receive a prompt from Internet Explorer.
4.  In the **Pandoc 1.19.2 Setup** dialog, review the License Agreement, select **I accept the terms in the License Agreeement**, and then click **Install**.
5.  Click **Finish**.


### Installing PowerShell Community Extensions 3.2.2

PowerShell Community Extensions (PSCX) is an open-source project that extends Windows PowerShell with scripts, cmdlets, functions, and other features. PSCX version 3.2.2 is the most current (as of 2/27/2018) PSCX version. You use PSCX to create the .zip files that contain your .docx files. Please note, if you do not install these extensions, the document-creation script fails. The PSCX files are made available through the PowerShell Gallery at https://www.powershellgallery.com/packages/Pscx/3.2.2.

To install PSCX 3.2.2, perform the following steps:

1. Open Windows PowerShell as an administrator.
2. Type **Install-Module -Name Pscx -RequiredVersion 3.2.2 -AllowClobber** and press Enter.
3. If prompted, type **Y** to install a new NuGet provider version and press Enter.
4. If prompted, type **Y** to allow the install from a untrusted repository and press Enter.
5. Wait for the install to finish, and then close the Windows PowerShell Window.


> **Important:** After you install Pandoc and PSCX, you must restart your computer to complete the installation. If you do not restart your computer, the document-creation script might fail.
