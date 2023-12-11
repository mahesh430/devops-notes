
# PersistentVolume
A Kubernetes Persistent Volume (PV) is a way to provision storage in a cluster, independent of the lifecycle of individual pods. Below is a simple example of a Persistent Volume (PV) definition in Kubernetes
```bash
apiVersion: v1
kind: PersistentVolume
metadata:
  name: example-pv
spec:
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteOnce
  persistentVolumeReclaimPolicy: Retain
  storageClassName: example-sc
  hostPath:
    path: /mnt/data

```

### Explanation

- apiVersion: v1 - This is the version of the Kubernetes API you're using.
- kind: PersistentVolume - Indicates that the file is for creating a Persistent Volume.
- metadata: name: example-pv - The name of the Persistent Volume.
- spec: capacity: storage: 1Gi - Specifies the size of the storage, which is 1 gigabyte.
- accessModes: - ReadWriteOnce - The volume can be mounted as read-write by a single node.
- persistentVolumeReclaimPolicy: Retain - When a user is finished with the volume, the data remains intact and the volume is considered "released".
- hostPath: path: /mnt/data - This specifies a directory on the host. (Note: hostPath is suited for testing but not recommended for production use.)


# PersistentVolumeClaim
To use the Persistent Volume (PV) defined in the earlier example, you'll need to create a PersistentVolumeClaim (PVC). The PVC requests storage resources from the PV. Here's an example PVC that matches the PV example-pv we defined earlier:
```bash
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: example-pvc
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
  storageClassName: example-sc
  volumeName: example-pv

```

### Explanation

- apiVersion: v1 - Specifies the version of the Kubernetes API.
- kind: PersistentVolumeClaim - Indicates that the file is for creating a PVC.
- metadata: name: example-pvc - The name of the PVC.
- spec: accessModes: - ReadWriteOnce - The access mode must match the PV’s access mode.
- resources: requests: storage: 1Gi - The amount of storage requested, matching the capacity of the PV.
- volumeName: example-pv - Specifies the binding to the specific PV named example-pv.


# StorageClass
In Kubernetes, a StorageClass is used to define and provision storage based on the underlying storage provider. When using AWS as your cloud provider, you can create a StorageClass that dynamically provisions Amazon Elastic Block Store (EBS) volumes. Here's an example of a StorageClass for AWS:
```bash
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: aws-ebs-sc
provisioner: kubernetes.io/aws-ebs
parameters:
  type: gp2
  fsType: ext4
reclaimPolicy: Retain
allowVolumeExpansion: true


```

### Explanation

- apiVersion: storage.k8s.io/v1 - Specifies the version of the Kubernetes StorageClass resource.
- kind: StorageClass - Indicates that this is a StorageClass resource.
- metadata: name: aws-ebs-sc - The name of the StorageClass.
- provisioner: kubernetes.io/aws-ebs - Specifies that this StorageClass uses the AWS EBS provisioner.
- parameters: type: gp2 - Defines the type of EBS volume (gp2 is General Purpose SSD).
- fsType: ext4 - The file system type to be used on the volume.
- reclaimPolicy: Retain - Determines how the storage is treated after it's released. In this case, the EBS volume will be retained.
- allowVolumeExpansion: true - Allows the EBS volume size to be increased.


## Example: Using a PVC in a Pod
To utilize this StorageClass, you need to reference it in your PersistentVolumeClaim (PVC). Here's an example PVC that uses the aws-ebs-sc StorageClass:
```bash
apiVersion: v1
kind: Pod
metadata:
  name: pod-using-pvc
spec:
  containers:
    - name: my-container
      image: nginx
      volumeMounts:
        - mountPath: "/usr/share/nginx/html"
          name: storage-volume
  volumes:
    - name: storage-volume
      persistentVolumeClaim:
        claimName: example-pvc
```

### Explanation

- apiVersion: v1 and kind: Pod specify the API version and kind for a pod.
- metadata: name: pod-using-pvc sets the name of the pod.
- containers: defines the container(s) inside the pod.
- name: my-container and image: nginx specify the container name and the image to use (nginx in this case).
- volumeMounts: is used to mount the volume inside the container.
- mountPath: "/usr/share/nginx/html" is the path where the volume will be mounted inside the container.
- name: storage-volume references the volume defined in the volumes section.
- volumes: defines the volumes at the pod level.
- name: storage-volume is the reference name used in volumeMounts.
- persistentVolumeClaim: claimName: example-pvc specifies that this volume is backed by the PVC named example-pvc.

### Login to the pod and create some files and check them they reflecting on host machine or not 
```bash
kubectl exec -it [pod name] -- sh
```
