# User and Group Management in Linux

In Linux, users and groups are essential for managing system access and permissions. Users are the individual accounts that can access the system, while groups are collections of users, allowing for efficient permission management.

### Managing Users

#### 1. `useradd`

**Description**:  
Creates a new user account.

**Example**:  
```bash
useradd newuser
```
This command creates a new user named `newuser`.

To see the created users in linux we can run  below command
```bash
cat /usr/passwd
```
---

#### 2. `usermod`

**Description**:  
Modifies a user account.

**Example**:  
```bash
usermod -aG sudo newuser
```
This command adds the user `newuser` to the `sudo` group, granting them administrative privileges.

---

#### 3. `userdel`

**Description**:  
Deletes a user account.

**Example**:  
```bash
userdel newuser
```
This command deletes the user `newuser`.

---

### Managing Groups

#### 1. `groupadd`

**Description**:  
Creates a new group.

**Example**:  
```bash
groupadd newgroup
```
This command creates a new group named `newgroup`.
To see the created groups in linux we can run  below command
```bash
cat /usr/group
```
---

#### 2. `groupdel`

**Description**:  
Deletes a group.

**Example**:  
```bash
groupdel newgroup
```
This command deletes the group named `newgroup`.

---

#### 3. `groups`

**Description**:  
Lists all groups a user belongs to.

**Example**:  
```bash
groups newuser
```
This command lists all the groups that the user `newuser` belongs to.

---
