# Pipelines & Redirection in Shell

This document provides examples of using pipelines and redirection in a shell environment, which are powerful tools for controlling the input and output of commands.

## 1. Pipe (`|`)

The pipe `|` is used to take the output of one command and use it as the input to another command.

**Example:**
```sh
ls | grep "myFile"
```
This command lists all files in the current directory (`ls`) and then `grep` is used to search for "myFile" in the list.

## 2. Redirect Standard Output (`>`)

The `>` operator is used to redirect the standard output of a command to a file, overwriting the file if it exists.

**Example:**
```sh
echo "Hello, World!" > hello.txt
```
This command writes "Hello, World!" to a file named `hello.txt`.

## 3. Append to File (`>>`)

The `>>` operator is used to append the standard output of a command to a file.

**Example:**
```sh
echo "This is a new line" >> hello.txt
```
This appends "This is a new line" to the end of `hello.txt`.

## 4. Redirect Standard Input (`<`)

The `<` operator is used to redirect standard input from a file to a command.

**Example:**
```sh
grep "Hello" < hello.txt
```
This command uses `grep` to search for the word "Hello" in `hello.txt`.

## 5. Redirect Error Output (`2>`)

The `2>` operator is used to redirect the error output of a command to a file.

**Example:**
```sh
ls non_existing_file 2> error.log
```
This command tries to list `non_existing_file` and redirects the error message to `error.log`.

## 6. Redirect Error Output to Standard Output (`2>&1`)

The `2>&1` operator is used to redirect error output to the same place as standard output.

**Example:**
```sh
ls non_existing_file >all_output.log 2>&1
```
This redirects both the standard output and error output of the `ls` command to `all_output.log`.

---
