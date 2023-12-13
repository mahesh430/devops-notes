# Text Processing Commands in Shell

This document provides an overview and examples of common text processing commands in a shell environment. These commands are essential for manipulating and analyzing text data in files.

## 1. Sort (`sort`)

The `sort` command is used to sort lines in text files.

**Example:**
```sh
sort names.txt
```
This command sorts the lines in `names.txt` in ascending order.

## 2. Cut (`cut`)

The `cut` command is used to remove sections from each line of files, typically for extracting columns of data.

**Example:**
```sh
cut -d',' -f1 data.csv
```
This command extracts the first column from a CSV file named `data.csv`.

## 3. AWK (`awk`)

`awk` is a powerful text processing programming language, used for manipulating data and generating reports.

**Example:**
```sh
awk '{print $2, $1}' names.txt
```
This command prints the second and first fields of each line in `names.txt`.

## 4. Sed (`sed`)

`sed` (stream editor) is used for filtering and transforming text.

**Example:**
```sh
sed 's/old/new/g' file.txt
```
This command replaces all occurrences of "old" with "new" in `file.txt`.

## 5. Word Count (`wc`)

The `wc` command is used to print the newline, word, and byte counts for files.

**Example:**
```sh
wc -l file.txt
```
This command counts the number of lines in `file.txt`.

---
