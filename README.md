# G-Drive_Syncro

A project created to asssist in backing up work in a directory to Google drive. Since my prefered choice of operating system is Ubuntu, I wanted to created a way to nearly fully automate this process with a few flags.

The vision behind it was to have a seemless and quick script to perform the push to any Google Drive account.

This script also has the capability of downloading files and directories from Google drive.

**Currently in active development; initial release**
_Powered by Team EuXe South West_

## Getting Started

These instructions help enable you to download and run this program for yourself.

### Prerequisites

**GDrive** - This script is entirely built around GDrive and will be needed in order to run correctly.

You can download the script from the repo (https://github.com/gdrive-org/gdrive) ran by the organisation gdrive-org.

**Google Account** - During the first time stage, you will need to provide access details to _GDrive_ by signing in and allowing the program (_GDrive_) to access your Google drive account. 

Each token lasts for a while before you will need to re-authenticate on Google.

_Please note that moving the **GDrive** file will require you to complete the sign up process again_

### Installing

**GDrive**

1) Download the script into a new folder or any directory,
2) Ensure that the script has permissions to execute (_chmod +x xxxxx_) if it does not.

**Syncro**

1) Download the script into a new folder;
2) Once again,allow the script to execute using **chmod +x syncro.sh**,
3) Execute the script to begin the first time setup.
_This setup will create a log file and a configuration file which can be manually edited_
**The loggin capability is still in devlopment**

## Flags

_Syncro runs as a light script and is entirely based on flags used with the script to perform actions_

An example of this: _./syncro -t_

Below you can find a list of flags currently in this release of _Syncro_:
**_-t_** - As used in the example, this flag will reset/check the GDrive token. If you have to re-authenticate then it's a sign that the token as expired.
**_-s_** - Basic save flag operator to save a file to Google Drive. 
**_-sc_** - _Save Custom_ flag with the custom varient to allow the user to upload a file from any **custom directory** instead of the same directory.
**_-sa_** - _Save All_ flag that allows the user to backup **entire directories**.
**_-d_** - _Download_ flag that will output everything inside your Google Drive and ask you to enter an ID from the list. **This command saves in the directory of your choice **
**_-dd_** - _Download all_ flag that allows the user to download entire directories from Google Drive.

## Built With

* Visual Studio Code: (https://code.visualstudio.com/) - Programming software used.
* GitHub: (https://github.com) - Glorious website
* GDrive: (https://github.com/gdrive-org/gdrive) - Script allowing simple cross platform with Google Drive.
* Ububtu 18.04 - Testing ground

## To-Do list

- Add comments to code
- Add screen-shots
- Add more flags
- Compress files (maybe)
- Add colouring to code
- Token handalisation for Google Drive.
