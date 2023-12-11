
## ConfigMap
A ConfigMap in Kubernetes is used to store non-confidential data in key-value pairs. Pods can consume ConfigMaps as environment variables, command-line arguments, or as configuration files in a volume.StorageClass:
```bash
apiVersion: v1
kind: ConfigMap
metadata:
  name: example-configmap
data:
  database: "sql"
  isProduction: "false"
  loggingLevel: "verbose"

```
Apply the
## Using the ConfigMap in a Pod 
#### There are different ways that you can use a ConfigMap to configure a container inside a Pod out of these we will use environment variable and volume approach:
 ### 1. Using ConfigMap as Environment Variables in a Pod
```bash
apiVersion: v1
kind: Pod
metadata:
  name: example-pod
spec:
  containers:
  - name: example-container
    image: nginx
    envFrom:
    - configMapRef:
        name: example-configmap
```
### 2. Using the ConfigMap as a Volume in a Pod
``` bash
apiVersion: v1
kind: Pod
metadata:
  name: example-pod
spec:
  containers:
  - name: example-container
    image: nginx
    volumeMounts:
    - name: config-volume
      mountPath: /etc/config
  volumes:
  - name: config-volume
    configMap:
      name: example-configmap
```
## Secrets

Kubernetes Secrets are used to store and manage sensitive information, such as passwords, OAuth tokens, and SSH keys. Similar to ConfigMaps, Secrets can be mounted as data volumes or exposed as environment variables to be used by a Pod. 
### 1. Creating a Secret
Secrets are usually created using a YAML file. However, before creating the YAML, you should encode your secret data in base64 format. Here's an example:

Let's say you have the following secrets:

- Username: myappuser
- Password: myapppassword
First, encode them in base64:
``` bash
echo -n 'myappuser' | base64    # Output: bXlhcHB1c2Vy
echo -n 'myapppassword' | base64 # Output: bXlhcHBwYXNzd29yZA==
```
Now, create a Secret using a YAML file:
```bash
apiVersion: v1
kind: Secret
metadata:
  name: myapp-secret
type: Opaque
data:
  username: bXlhcHB1c2Vy
  password: bXlhcHBwYXNzd29yZA==
```
#### Using secrets in a pod using env
```bash
apiVersion: v1
kind: Pod
metadata:
 name: example-pod
spec:
 containers:
 - name: nginx
   image: nginx
   env:
      - name: SECRET_USERNAME
        valueFrom:
          secretKeyRef:
            name: myapp-secret
            key: username
      - name: SECRET_PASSWORD
        valueFrom:
          secretKeyRef:
            name: myapp-secret
            key: password	

```
### 2. Using Secrets in a Pod as a Volume
``` bash
apiVersion: v1
kind: Pod
metadata:
  name: myapp-pod
spec:
  containers:
  - name: myapp-container
    image: myapp-image
    volumeMounts:
    - name: secret-volume
      mountPath: "/etc/secrets"
      readOnly: true
  volumes:
  - name: secret-volume
    secret:
      secretName: myapp-secret
```
