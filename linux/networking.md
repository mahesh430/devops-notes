# Networking
### 1. `ping`

**Description**: 
`ping` is used to send ICMP ECHO_REQUEST packets to network hosts. This command helps to test the reachability of a host on an IP network and measures the round-trip time for messages sent from the originating host to a destination computer.

**Example**:
```bash
ping google.com
```
This command pings the server at `google.com` and displays the round-trip time for packets sent from the local host to `google.com`.

---

### 2. `netstat`

**Description**: 
`netstat` displays network connections (both incoming and outgoing), routing tables, and a number of network interface statistics.

**Example**:
```bash
netstat -a
```
This command lists all ports and connections.

---

### 3. `ifconfig`

**Description**: 
`ifconfig` is used to configure, or view the configuration of, a network interface.

**Example**:
```bash
ifconfig eth0
```
This command displays the configuration of the network interface `eth0`.

---

### 4. `ssh`

**Description**: 
`ssh` or Secure Shell is a protocol used to securely connect to a remote server or host.

**Example**:
```bash
ssh username@remote_host
```
This command connects you to `remote_host` as `username`.

---

### 5. `scp`

**Description**: 
`scp` stands for secure copy. It is used to securely transfer files between hosts on a network.

**Example**:
```bash
scp file.txt username@remote_host:/path/to/destination
```
This command securely copies `file.txt` from the local machine to the specified path on `remote_host`.

---
Certainly! Below are examples of other networking commands like `nslookup` and `dig`, formatted in a GitHub documentation style using Markdown.

---
### 6. `nslookup`

**Description**:  
`nslookup` is a network administration command-line tool used for querying the Domain Name System (DNS) to obtain domain name or IP address mapping, or other specific DNS records.

**Example**:  
```bash
nslookup example.com
```
This command queries the DNS for information about the domain `example.com`.

---

### 7. `dig`

**Description**:  
`dig` (domain information groper) is used for probing DNS servers. It is useful for network troubleshooting and for educational purposes.

**Example**:  
```bash
dig example.com
```
This command performs a DNS lookup for `example.com` and displays detailed information about the query.

---

### 8. `traceroute`

**Description**:  
`traceroute` tracks the path that an IP packet follows to an internet host.

**Example**:  
```bash
traceroute example.com
```
This command shows the route taken by packets across an IP network from your computer to `example.com`.

---

### 9. `netcat`

**Description**:  
`netcat` is a utility for reading from and writing to network connections using TCP or UDP protocols.

**Example**:  
```bash
netcat example.com 80
```
This opens a TCP connection to port 80 of `example.com`.

---

### 10. `telnet`

**Description**:  
`telnet` is a network protocol used on the internet or local area networks to provide a bidirectional interactive text-oriented communication facility using a virtual terminal connection.

**Example**:  
```bash
telnet example.com 23
```
This command uses telnet to connect to `example.com` on port 23.

---

