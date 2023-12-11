# Process Management in Unix/Linux

In Unix/Linux, process management is crucial for system administration. The following commands help you manage and interact with processes.

## 1. `ps`
Displays information about active processes. Without any options, it shows processes running in the current shell.

```bash
ps  # Display processes in the current shell
ps aux  # Display all processes with detailed info
```

## 2. `top`
Provides a dynamic, real-time view of running processes. It displays a variety of system statistics.

```bash
top
```

## 3. `kill`
Sends a signal to a process, typically used to terminate processes. The most common signal is `SIGTERM` (15) to gracefully terminate a process and `SIGKILL` (9) to forcefully terminate it.

```bash
kill [signal] [process_id]
kill -9 [process_id]  # Forcefully terminate a process
```

## 4. `bg`
Puts a job in the background. If you have a suspended job, you can resume it in the background with `bg`.

```bash
bg %jobnumber  # Resume a suspended job in the background
```

## 5. `fg`
Brings a job to the foreground. If you have a job running in the background, you can bring it to the foreground with `fg`.

```bash
fg %jobnumber  # Bring a background job to the foreground
```
