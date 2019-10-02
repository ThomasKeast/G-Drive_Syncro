#!/bin/bash

# Configuration file should be located WITH the bash file
syn_conf=./syncro_conf.cfg

# Initiate logging for the program
syn_log=./syncro_log.txt
if [ -f "$syn_log" ]
then
    syn_void="True"
else
    touch $syn_log
fi

if [[ $1 == "-t" ]]
then
    source $syn_conf
    clear
    echo "Syncro developed by Thomas Keast"
    echo "In partnership with Team EuXe"
    echo "==================================="
    echo "Syncro -=- Token Flag '-t'"
    echo "==================================="
    echo "This flag will help ou get a new GDrive authentication token in order to utilise Syncro correctly..."
    echo "GDrive path: $GDRIVE_PATH"
    $GDRIVE_PATH about
    exit
elif [[ $1 == "-sa" ]]
then
    source $syn_conf
    clear
    echo "Syncro developed by Thomas Keast"
    echo "In partnership with Team EuXe"
    echo "==================================="
    echo "Syncro -=- Save All Flag '-sa'"
    echo "==================================="
    $GDRIVE_PATH upload "$SYNC_PATH" --recursive
    sleep 1
    echo "Done!"
    exit
elif [[ $1 == "-s" ]]
then
    source $syn_conf
    clear
    echo "Syncro developed by Thomas Keast"
    echo "In partnership with Team EuXe"
    echo "==================================="
    echo "Syncro -=- Save Single File Flag '-s'"
    echo "==================================="
    echo "The path $SYNC_PATH will be used; use the '-sc' flag for a custom path"
    s_pathver="false"
    while [[ $s_pathver == "false" ]]
    do
        read -p "Please enter the file you wish to upload - " sflag_c
        if [[ -f "$sflag_c" ]]
        then
            s_pathver="true"
            sflag_c=$sflag_c
        else
            echo "File not found, please try again..."
            sleep 1
        fi
    done
    echo "$SYNC_PATH$sflag_c"
    $GDRIVE_PATH upload "$SYNC_PATH$sflag_c"
    sleep 1
    echo "Done!"
    exit
elif [[ $1 == "-sc" ]]
then
    source $syn_conf
    clear
    echo "Syncro developed by Thomas Keast"
    echo "In partnership with Team EuXe"
    echo "==================================="
    echo "Syncro -=- Save Single File (Custom Path) Flag '-sc'"
    echo "==================================="
    s_pathver="false"
    while [[ $s_pathver == "false" ]]
    do
        read -p "Please enter the full path and file you wish to upload - " sflag_c
        if [[ -f "$sflag_c" ]]
        then
            s_pathver="true"
            sflag_c=$sflag_c
        else
            echo "File not found, please try again..."
            sleep 1
        fi
    done
    echo "$sflag_c"
    $GDRIVE_PATH upload "$sflag_c"
    sleep 1
    echo "Done!"
    exit
elif [[ $1 == "-d" ]]
then
    source $syn_conf
    clear
    echo "Syncro developed by Thomas Keast"
    echo "In partnership with Team EuXe"
    echo "==================================="
    echo "Syncro -=- Download File Flag '-d'"
    echo "==================================="
    echo "Please note that you should use '-dd' for downloading directories from Google Drive..."
    echo "In a few seconds, the command will list everything in your Google Drive"
    echo "Copy the ID of a FILE you wish to download (Will overwrite)..."
    sleep 3
    $GDRIVE_PATH list
    read -p "Please enter the file ID you wish to download - " sflag_c
    d_pathver="false"
    while [[ $d_pathver == "false" ]]
    do
        read -p "Please enter the path where you would like to save to - " d_path
        if [[ -d "$d_path" ]]
        then
            d_pathver="true"
            d_path=$d_path
        else
            echo "Path not found, please try again..."
            sleep 1
        fi
    done
    $GDRIVE_PATH download "$sflag_c" --path $d_path --force
    sleep 1
    echo "Done!"
    exit
elif [[ $1 == "-dd" ]]
then
    source $syn_conf
    clear
    echo "Syncro developed by Thomas Keast"
    echo "In partnership with Team EuXe"
    echo "==================================="
    echo "Syncro -=- Download Directory Flag '-dd'"
    echo "==================================="
    echo "Please note that you should use '-d' for downloading single files from Google Drive..."
    echo "In a few seconds, the command will list everything in your Google Drive"
    echo "Copy the ID of a DIRECTORY you wish to download (Will overwrite if it exists on disk)..."
    sleep 3
    $GDRIVE_PATH list
    read -p "Please enter the direcory ID you wish to download - " sflag_c
    d_pathver="false"
    while [[ $d_pathver == "false" ]]
    do
        read -p "Please enter the path where you would like to save to - " d_path
        if [[ -d "$d_path" ]]
        then
            d_pathver="true"
            d_path=$d_path
        else
            echo "Path not found, please try again..."
            sleep 1
        fi
    done
    $GDRIVE_PATH download "$sflag_c" --path $d_path --force --recursive
    sleep 1
    echo "Done!"
    exit
elif [[ $1 == "summon" ]]
then
    curr_user=`whoami`
    echo "$curr_user draws a card..."
    sleep 1
    echo "$curr_user draws Debris Dragon!"
    sleep 1
    echo "$curr_user also has Speed Warrior AND Quillbolt Hedgehog!"
    sleep 1 
    echo "$curr_user Syncro summons Stardust Dragon - A Level 8 monster with 2500 attack!"
    sleep 1
    echo "$curr_user Attacks a 100 Attack enemy monster and wipes him from the match!"
    sleep 1
    echo "$curr_user is the Winner!!!"
    exit
else
    void="true"
fi

if [[ -f "$syn_conf" ]]
then
    source ./syncro_conf.cfg
    echo -e "Configuration file found and looks good!"
    echo "Please ensure that your google account is linked and information appears below:"
    $GDRIVE_PATH about
else
    clear
    echo "Executing first time use;"
    echo ""
    echo "The Syncro configuration file was not located..."
    echo "One will be needed to proceed, generating one now..."
    sleep 2
    read -p "Please enter an absolute path (Directory) you wish to push to Google Drive (Inlcude the / at the end)- " syncro_path_s
    if [ -d "$syncro_path_s" ]
    then
        echo "Path saved!"
        echo "SYNC_PATH=$syncro_path_s" > "./syncro_conf.cfg"
    else
        echo "Path was not located, would you like to proceed anyway or retry? (s = skip and continue ;r = retry/enter new path)"
        read -p "[s/r] - " syn_path_prompt
        if [ "$syn_path_prompt" == "s" ]
        then
            echo "Proceeding to add the path anyway..."
            syncro_path_s=$syncro_path_s
            echo "SYNC_PATH=$syncro_path_s" > "./syncro_conf.cfg"
            echo "Saved!"
        elif [ "$syn_path_prompt" == "r" ]
        then
            syn_path_confirm="false"
            while [[ $syn_path_confirm == "false" ]]
            do
                read -p "Please enter an absolute path you wish to push - " syncro_path_s
                if [ -d "$syncro_path_s" ]
                then
                    echo "Path saved!"
                    echo "SYNC_PATH=$syncro_path_s" > "./syncro_conf.cfg"
                    syn_path_confirm="true"
                else
                    echo "Path was incorrect... Please try again"
                    sleep 1
                fi
            done
        fi
    fi
    echo "==============================================================================="
    echo ""
    echo "Next, we will need to locate where your GDrive file is located; this should already have the right permissions to execute (chmod +x)"
    echo "If you have changed the name of the file then please ensure to add that at the end of the path. /home/joe/gdrive for example."
    read -p "Please enter the path and file name of the GDrive file (/home/joe/gdrive-linux-x64) - " syn_main_path
    if [ -f "$syn_main_path" ]
    then
        echo "File found!"
        if [ `stat -c %A $syn_main_path | sed 's/...\(.\).\+/\1/'` == "x" ]
        then
            echo "Permissions are also correct!"
            echo "GDRIVE_PATH=$syn_main_path" >> "./syncro_conf.cfg"
        else
            echo "Permissions appear to be wrong; you may experience issues when syncing..."
            echo "If you haven't already; please run 'chmod +x' $syn_main_path and sync your google account to GDrive using ($syn_main_path about)"
            echo "GDRIVE_PATH=$syn_main_path" >> "./syncro_conf.cfg"
        fi
    else
        echo "File not found, please confirm and re-enter it here;"
        syn_file_confirm="false"
        while [[ $syn_file_confirm == "false" ]]
        do
            read -p "Please enter an absolute path you wish to push - " syncro_file_s
            if [ -f "$syncro_file_s" ]
            then
                echo "Path saved!"
                echo "GDRIVE_PATH=$syncro_file_s" >> "./syncro_conf.cfg"
                syn_main_path=$syncro_file_s
                syn_file_confirm="true"
            else
                echo "Path was incorrect... Please try again"
                sleep 1
            fi
        done
    fi
    echo "The startup has been completed, you can now use the flags to continue."
    echo "For a list of flags, plesae visit the GitHub page for more information."
fi
