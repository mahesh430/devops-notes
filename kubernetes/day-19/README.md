# Requests and limits 
When you specify a Pod, you can optionally specify how much of each resource a container needs. The most common resources to specify are CPU and memory (RAM); there are others.
``` bash
apiVersion: v1
kind: Pod
metadata:
  name: cpu-stress-pod
spec:
  containers:
  - name: stress
    image: polinux/stress
    resources:
      limits:
        cpu: "0.5"
        memory: "128Mi"
      requests:
        cpu: "0.2"
        memory: "64Mi"
    command: ["stress"]
    args: ["--cpu", "1", "--timeout", "60s"]

```
# Horizontal Pod Autoscaling (HPA)
Horizontal Pod Autoscaling (HPA) in Kubernetes automatically scales the number of pods in a deployment, replication controller, replica set, or stateful set based on observed CPU utilization (or, with custom metrics support, on some other application-provided metrics).


### Prerequisites:
- Metrics Server: Make sure the Metrics Server is deployed in your cluster. The HPA uses metrics from the Metrics Server to make scaling decisions.

- Deployment to Scale: You need a deployment that HPA can scale. For example, let's assume you have a deployment named my-webapp that you want to scale based on CPU usage.
### Deploy the Metrics Server with the following command:
``` bash
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
```
### Verify that the metrics-server deployment is running the desired number of Pods with the following command.
``` bash
 kubectl get deployment metrics-server -n kube-system
```
### Step 1: Create a Deployment
First, ensure you have a deployment. Here’s an example deployment (my-webapp-deployment.yaml):
``` bash 
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-webapp
spec:
  replicas: 3
  selector:
    matchLabels:
      app: my-webapp
  template:
    metadata:
      labels:
        app: my-webapp
    spec:
      containers:
      - name: stress
        image: polinux/stress
        resources:
          limits:
            cpu: "0.5"
            memory: "128Mi"
          requests:
            cpu: "0.2"
            memory: "64Mi"
        command: ["stress"]
        args: ["--cpu", "1", "--timeout", "60s"]

```
### Apply this deployment with:
``` bash 
kubectl apply -f my-webapp-deployment.yaml
```
### Step 2: Create a Horizontal Pod Autoscaler
Next, create an HPA resource targeting your deployment. This example (my-webapp-hpa.yaml) autoscales my-webapp based on CPU utilization:
``` bash 
apiVersion: autoscaling/v1
kind: HorizontalPodAutoscaler
metadata:
  name: my-webapp-hpa
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: my-webapp
  minReplicas: 2
  maxReplicas: 10
  targetCPUUtilizationPercentage: 50

```
Apply the HPA with:
 ``` bash 
 kubectl apply -f my-webapp-hpa.yaml
```
### Step 3: Monitoring
After deploying the HPA, you can monitor its status with:
``` bash 
kubectl get hpa
```
# DaemonSet
A DaemonSet ensures that all (or some) Nodes run a copy of a Pod. As nodes are added to the cluster, Pods are added to them. As nodes are removed from the cluster, those Pods are garbage collected. Deleting a DaemonSet will clean up the Pods it created.

Some typical uses of a DaemonSet are:

- running a cluster storage daemon on every node
- running a logs collection daemon on every node
- running a node monitoring daemon on every node

### Example: Creating a DaemonSet for a Logging Agent
Let's create a DaemonSet that deploys a logging agent on every node of the cluster.
``` bash 
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: logging-daemon
  namespace: kube-system
spec:
  selector:
    matchLabels:
      name: logging-daemon
  template:
    metadata:
      labels:
        name: logging-daemon
    spec:
      containers:
      - name: log-agent
        image: log-agent:latest
        resources:
          requests:
            memory: "64Mi"
            cpu: "250m"
          limits:
            memory: "128Mi"
            cpu: "500m"
        volumeMounts:
        - name: varlog
          mountPath: /var/log
        - name: varlibdockercontainers
          mountPath: /var/lib/docker/containers
          readOnly: true
      terminationGracePeriodSeconds: 30
      volumes:
      - name: varlog
        hostPath:
          path: /var/log
      - name: varlibdockercontainers
        hostPath:
          path: /var/lib/docker/containers

```
This DaemonSet definition does the following:

- It creates a DaemonSet named logging-daemon.
- The DaemonSet deploys pods with a container running log-agent:latest (this should be an image of a logging agent that you intend to use).
- It mounts two host paths, /var/log and /var/lib/docker/containers, which are common directories where logs are stored. This allows the log agent to access host logs.
### Apply the DaemonSet:
To create the DaemonSet in your cluster, save the above YAML to a file, for example, logging-daemonset.yaml, and apply it:
``` bash 
kubectl apply -f logging-daemonset.yaml
```
### Verify the DaemonSet:
After applying the YAML, you can check the status of the DaemonSet:
``` bash
kubectl get daemonset -n kube-system
```
# StatefulSets
A StatefulSet in Kubernetes is used for managing stateful applications. It manages the deployment and scaling of a set of Pods, and provides guarantees about the ordering and uniqueness of these Pods. Unlike a Deployment, a StatefulSet maintains a sticky identity for each of their Pods. These pods are created from the same spec, but are not interchangeable: each has a persistent identifier that it maintains across any rescheduling.

### Example: StatefulSet with a Web Application
Suppose you want to deploy a web application that requires stable storage and stable network identifiers. Here’s an example StatefulSet (web-app-statefulset.yaml) definition:
``` bash
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: web-app
spec:
  serviceName: "web-service"
  replicas: 3
  selector:
    matchLabels:
      app: my-web-app
  template:
    metadata:
      labels:
        app: my-web-app
    spec:
      containers:
      - name: web-container
        image: nginx
        ports:
        - containerPort: 80
          name: web
        volumeMounts:
        - name: www
          mountPath: /usr/share/nginx/html
  volumeClaimTemplates:
  - metadata:
      name: www
    spec:
      accessModes: [ "ReadWriteOnce" ]
      resources:
        requests:
          storage: 1Gi
```
