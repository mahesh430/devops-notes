# Text Processing Commands in Shell

This document provides an overview of common text processing commands in a shell environment, along with their most used flags and practical examples.

## 1. Sort (`sort`)

Sorts lines in text files.

**Common Flags:**
- `-n`: Sorts based on numerical value.
- `-r`: Reverses the result of comparisons.
- `-R`: Shuffles (randomizes) the output.

**Example:**
```sh
sort -nr file.txt
```
Sorts the lines in `file.txt` numerically in reverse order.

## 2. Cut (`cut`)

Removes sections from each line of files.

**Common Flags:**
- `-d`: Specifies the delimiter.
- `-f`: Selects only these fields.
#### sample data
``` bash
ID,Name,Age,Department
101,John Doe,30,Marketing
102,Jane Smith,25,Finance
103,Emily Johnson,40,Human Resources
104,Michael Brown,50,IT
105,Lisa Davis,35,Research
```
**Example:**
```sh
cut -d':' -f1 file.txt
```
Extracts the first field from each line in `file.txt`, assuming ':' as the field delimiter.

## 3. AWK (`awk`)

Awk is a scripting language used for manipulating data and generating reports. The awk command programming language requires no compiling and allows the user to use variables, numeric functions, string functions, and logical operators. 

**Common Usage:**
- `{print $1, $2}`: Prints specific fields.
- `/pattern/ {action}`: Applies action to lines matching pattern.
### sample data
``` bash
ajay manager account 45000
sunil clerk account 25000
varun manager sales 50000
amit manager account 47000
tarun peon sales 15000
deepak clerk sales 23000
sunil peon sales 13000
satvik director purchase 80000
```
**Example:**
```sh
awk '/manager/ {print}' employee.txt
```
```sh
awk '/error/ {print $1}' log.txt
```
```sh
awk '{print $1,$4}' employee.txt 
```
Prints the first field of lines that contain the word "error" in `log.txt`.

## 4. Sed (`sed`)

SED command in UNIX stands for stream editor and it can perform lots of functions on file like searching, find and replace, insertion or deletion. Though most common use of SED command in UNIX is for substitution or for find and replace. By using SED you can edit files even without opening them, which is much quicker way to find and replace something in file, than first opening that file in VI Editor and then changing it.

**Common Flags:**
- `s/pattern/replacement/`: Substitutes pattern with replacement.
### sample data
``` bash
unix is great os. unix is opensource. unix is free os.
learn operating system.
unix linux which one you choose.
unix is easy to learn.unix is a multiuser os.Learn unix .unix is a powerful.
```

**Example:**
```sh
sed  's/unix/linux/g' file.txt
```
Replaces all occurrences of "old" with "new" in `file.txt` directly in the file.

## 5. Word Count (`wc`)

Prints newline, word, and byte counts for files.

**Common Flags:**
- `-l`: Prints the line count.
- `-w`: Prints the word count.
- `-c`: Prints the byte count.

**Example:**
```sh
wc -lw file.txt
```
Prints the line and word count of `file.txt`.

---
