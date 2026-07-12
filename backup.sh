#!/bin/bash
if [ $# -ne 2 ]; then
    echo "Enter source and destination path"
    exit 1
fi

sourceDir="$1"
destDir="$2"
timestamp=$(date '+%Y-%m-%d-%H-%M-%S')

function createBackup {
    tar -czf "${destDir}/backup_${timestamp}.tar.gz" "${sourceDir}"

    if [ $? -eq 0 ]; then
        echo "Backup generated successfully at ${timestamp}"
    else
        echo "Backup creation failed."
        exit 1
    fi
}

function performRotation {
    echo "Checking backup rotation..."

    cd "${destDir}"

    backups=($(ls -t backup_*.tar.gz))

    if [ ${#backups[@]} -gt 5 ]; then
        echo "More than 5 backups found. Removing older backups..."

        for backup in "${backups[@]:5}"; 
        do
            rm -f "${backup}"
        done
    fi
}

createBackup
performRotation
