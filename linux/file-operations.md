# File Operations in Unix/Linux

This guide covers essential file operation commands in Unix/Linux, providing explanations and examples for each command.

## 1. `touch`
Creates an empty file or updates the timestamp of an existing file.

```bash
touch newfile.txt
```

## 2. `cp`
Copies files or directories from one location to another.

```bash
cp source.txt destination.txt  # Copy file
cp -r source_directory destination_directory  # Copy directory recursively
```

## 3. `mv`
Moves or renames files or directories.

```bash
mv oldname.txt newname.txt  # Rename file
mv file.txt /path/to/directory/  # Move file
```

## 4. `rm`
Removes files or directories. Use with caution, especially with `-r` for recursive deletion.

```bash
rm file.txt  # Remove file
rm -r directory/  # Remove directory and its contents
```

## 5. `find`
Searches for files in a directory hierarchy based on criteria like name, type, etc.

```bash
find /path/to/search -name "filename"  # Find files by name
find /path -type d  # Find directories
```

## 6. `grep`
Searches text using patterns. Often used with regex.

```bash
grep "pattern" file.txt  # Basic search
grep -r "pattern" /path/to/search  # Recursive search
```

## 7. `head`
Outputs the first part (top lines) of files.

```bash
head -n 5 file.txt  # Display first 5 lines
```

## 8. `tail`
Outputs the last part (bottom lines) of files.

```bash
tail -n 5 file.txt  # Display last 5 lines
```

## 9. `diff`
Compares files line by line, showing differences.

```bash
diff file1.txt file2.txt
```

## 10. `chmod`
Changes file permissions. Permissions can be set using numeric (octal) or symbolic notation.

### File Permission Types
- **Read (r)**: 4
- **Write (w)**: 2
- **Execute (x)**: 1

### Examples
```bash
chmod 755 file.txt  # rwx for owner, rx for group and others
chmod u+x file.txt  # Add execute permission for the owner
```

## 11. `chown`
Changes file owner and group. Only the superuser or the owner of a file can change its ownership.

### Syntax
- `chown [new-owner]:[new-group] [file]`

### Examples
```bash
chown user:group file.txt  # Change owner and group
chown user file.txt  # Change owner only
```
