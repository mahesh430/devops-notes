
## POD

Pods are the smallest deployable units of computing that you can create and manage in Kubernetes.

```bash
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
  - name: nginx
    image: nginx:1.14.2
    ports:
    - containerPort: 80

```

## Deployment

Kubernetes Deployment ensures consistent application deployment by maintaining a specified number of pod replicas. For instance, deploying a web server application with a Kubernetes Deployment can keep three replicas running, providing load balancing and redundancy to handle incoming traffic efficiently.
```bash
apiVersion: apps/v1
kind: Deployment
metadata:
  name: webserver-deployment
  labels:
    app: webserver
spec:
  replicas: 3
  selector:
    matchLabels:
      app: webserver
  template:
    metadata:
      labels:
        app: webserver
    spec:
      containers:
      - name: webserver
        image: nginx:1.17.4
        ports:
        - containerPort: 80

```
### ReplicaSet
A ReplicaSet is a Kubernetes resource that ensures a specified number of pod replicas are always running. It is used to maintain the desired state of pod replication.
```bash
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: frontend
  labels:
    app: guestbook
    tier: frontend
spec:
  # modify replicas according to your case
  replicas: 3
  selector:
    matchLabels:
      tier: frontend
  template:
    metadata:
      labels:
        tier: frontend
    spec:
      containers:
      - name: php-redis
        image: gcr.io/google_samples/gb-frontend:v3

```
### ReplicationController
A ReplicationController is an earlier Kubernetes concept similar to a ReplicaSet, designed to keep a specific number of pod replicas running at any given time. It has been largely superseded by ReplicaSets and Deployments.
```bash
apiVersion: v1
kind: ReplicationController
metadata:
  name: nginx
spec:
  replicas: 3
  selector:
    app: nginx
  template:
    metadata:
      name: nginx
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx
        ports:
        - containerPort: 80

```
### Difference between ReplicaSet vs ReplicationController
ReplicaSets support set-based selector requirements, allowing more flexible selection criteria, whereas ReplicationControllers only support equality-based selector requirements.

### Static Pods
Static pods are a unique type of pod in Kubernetes, managed directly by the kubelet daemon on a specific node, rather than by the Kubernetes API server. They are typically used for running system-level services necessary for the Kubernetes node itself.

#### Static Pod Example
Suppose you want to run an Nginx server as a static pod on a Kubernetes node. You would create a YAML file with the pod definition and place it in a directory on the node that the kubelet is configured to watch for static pod definitions.
```bash
apiVersion: v1
kind: Pod
metadata:
  name: nginx-static-pod
  labels:
    role: myrole
spec:
  containers:
    - name: nginx
      image: nginx
      ports:
        - containerPort: 80
```
