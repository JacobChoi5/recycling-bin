# Linux Recycling Bin

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

## Technologies Used

* **Bash**
* **GNU Coreutils** (`mv`, `rm`, `ls`, `mkdir`)
* **getopts** for CLI parsing
* Linux home directory structure

# Demonstration
<img width="1920" height="1140" alt="image" src="https://github.com/user-attachments/assets/cca70499-fe0c-445b-be17-42b6eeee81f0" />

1. **Initial state:**
   The working directory contains three example files and `rbin.sh`. The recycle bin (`~/.recycle`) does not yet exist.

2. **Help message:**
   Running `./rbin.sh -h` correctly displays usage information.

3. **Invalid option:**
   Running `./rbin.sh -q` shows an error for an unknown flag and prints the usage message.

4. **Sending files to recycle bin:**
   Running `./rbin.sh example1.txt` moves the file into `~/.recycle`, automatically creating the folder.
   Running `./rbin.sh example2.txt example3.txt` moves the remaining examples.

5. **Listing recycle bin:**
   `./rbin.sh -l` shows the files currently stored in the recycle bin.

6. **Emptying the bin:**
   `./rbin.sh -p` removes the entire `.recycle` directory, and `ls ~/.recycle` confirms it is gone.
