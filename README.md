# Backup Automation Shell Script

## Overview

This Bash script automates the process of creating compressed backups of a directory and maintains only the latest five backups by deleting older ones. The backup process is further automated using a **cron job**, which executes the script every day at **2:00 AM**.

## Features

- Creates a compressed `.tar.gz` backup.
- Adds a timestamp to each backup.
- Automatically keeps only the latest **5 backups**.
- Deletes older backups to save disk space.
- Supports automated execution using a cron job.
- Validates the command-line arguments.

## Prerequisites

- Linux
- Bash Shell
- `tar` utility
- `cron` service running

## Usage

```bash
chmod +x backup.sh

./backup.sh <source_directory> <destination_directory>
```

### Example

```bash
./rotation_backup.sh /home/user/Files /home/user/Backups
```

## Backup Naming Format

```
backup_YYYY-MM-DD-HH-MM-SS.tar.gz
```

Example:

```
backup_2026-07-13-10-30-15.tar.gz
```

## How it Works

1. Verifies that exactly two command-line arguments are provided.
2. Creates a compressed `.tar.gz` archive of the source directory.
3. Stores the backup in the destination directory with a timestamp.
4. Lists all available backups sorted by modification time.
5. Keeps only the five most recent backups.
6. Deletes older backups automatically.

## Automating with Cron

A cron job has been configured to execute the backup script **daily at 2:00 AM**.

Cron entry:

```cron
0 2 * * * /path/to/rotation_backup.sh /path/to/source_directory /path/to/destination_directory
```

This schedule means:

- **0** → Minute
- **2** → Hour (2:00 AM)
- **\*** → Every day of the month
- **\*** → Every month
- **\*** → Every day of the week

## Example Output

<img width="1199" height="342" alt="image" src="https://github.com/user-attachments/assets/3657f20c-3ca7-4285-8c74-88e8f3b6d323" />

<img width="1068" height="189" alt="image" src="https://github.com/user-attachments/assets/33b8f63b-307a-4baa-bcff-d28debca0ce7" />

<img width="1206" height="611" alt="image" src="https://github.com/user-attachments/assets/13257bec-9d85-4761-8d76-076016559ba4" />
