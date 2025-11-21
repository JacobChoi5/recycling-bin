# rbin.sh – A Linux Recycle Bin Utility

A lightweight and simple Bash-based recycle bin tool that safely manages file deletion in a Linux environment.  
Instead of permanently deleting files with `rm`, this script moves them into a hidden `~/.recycle` directory, allowing for easy recovery and safer workflows.
This project was made for my Systems Programming Class, and provided me with great skillsets in Bash scripting, Linux commands, file management, and flag handling.

## Features
- **Safe deletion**: Moves files and directories into `~/.recycle` instead of permanently deleting them.
- **List mode (`-l`)**: Lists the current contents of the recycle bin.
- **Purge mode (`-p`)**: Purges all recycled files.
- **Help menu (`-h`)**: Displays usage information.
- **Input validation & defensive coding**:
  - Detects invalid flags
  - Prevents combining incompatible options
  - Warns about missing files
  - Provides descriptive error messages

## File System
- rbin.sh: Script for managing the recycle bin.
- /home/<username>/.recycle: Separate recycle bin for each user on the system.

## Usage
Usage: rbin.sh [-hlp] [list of files]
   -h: Display this help;
   -l: List files in the recycle bin;
   -p: Empty all files in the recycle bin;
   [list of files] with no other flags,
        these files will be moved to the
        recycle bin.

### Examples
Move files to the recycle bin:

```bash
./rbin.sh file1.txt notes.pdf
```

List recycled files:

```bash
./rbin.sh -l
```

Purge all recycled files:

```bash
./rbin.sh -p
```

Show help:

```bash
./rbin.sh -h
```

---

## Security & Safety Considerations

This project emphasizes safe Linux file operations:

* Avoids immediate irreversible deletion (`rm`)
* Ensures directories exist before using them (`mkdir -p`)
* Validates user input and flags
* Displays warnings for non-existent files
* Uses per-user recycle directories to prevent permission issues

This approach mirrors real-world practices used in:

* Secure file handling
* Forensics tooling
* Backup & recovery systems
* User-space safe deletion utilities

---

## Technologies Used

* **Bash**
* **GNU Coreutils** (`mv`, `rm`, `ls`, `mkdir`)
* **getopts** for CLI parsing
* Linux home directory structure
---

