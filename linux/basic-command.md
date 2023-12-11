
# Basic Unix/Linux Commands Guide

## 1. `echo`
Prints given arguments to the terminal. It's often used in scripts and for displaying environment variables.

```bash
echo "Hello, World!"
echo $HOME  # Displays the home directory path
```

## 2. `pwd`
Prints the current working directory. It's useful for confirming your current directory in a shell.

```bash
pwd
```

## 3. `cd`
Changes the current directory. `cd ~` takes you to your home directory, while `cd -` takes you to the previous directory.

```bash
cd /path/to/directory
cd ..  # Go up one directory
```

## 4. `ls`
Lists the contents of a directory. With options, it can list hidden files (`-a`) or list in detail (`-l`).

```bash
ls
ls -l  # Detailed list including file permissions
ls -a  # Include hidden files
```

## 5. `cat`
Concatenates and displays the content of files. Commonly used for viewing short files.

```bash
cat filename.txt
```

## 6. `man`
Displays the manual pages of a command. It's a great resource for learning about command options and usage.

```bash
man ls
```

## 7. `exit`
Exits the shell or your current session.

```bash
exit
```

## 8. `clear`
Clears the terminal screen. Useful for decluttering the console view.

```bash
clear
```

## 9. `history`
Displays the command history. You can rerun commands from the history using `!number`.

```bash
history
history | grep "search_term"  # Search history for a specific term
```
