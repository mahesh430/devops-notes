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

A text processing programming language.

**Common Usage:**
- `{print $1, $2}`: Prints specific fields.
- `/pattern/ {action}`: Applies action to lines matching pattern.

**Example:**
```sh
awk '/error/ {print $1}' log.txt
```
Prints the first field of lines that contain the word "error" in `log.txt`.

## 4. Sed (`sed`)

Stream editor for filtering and transforming text.

**Common Flags:**
- `s/pattern/replacement/`: Substitutes pattern with replacement.
- `-i`: Edits files in place.

**Example:**
```sh
sed -i 's/old/new/g' file.txt
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

These examples and flags provide a glimpse into the functionality of each command. The commands `sort`, `cut`, `awk`, `sed`, and `wc` are versatile tools in text processing and are essential for shell scripting and command-line data manipulation.
