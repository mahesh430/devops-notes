# Service Accounts
A service account is a type of non-human account that, in Kubernetes, provides a distinct identity in a Kubernetes cluster. Application Pods, system components, and entities inside and outside the cluster can use a specific ServiceAccount's credentials to identify as that ServiceAccount. 

#### To create a service account, you define it in a YAML file and then apply it using kubectl. Here's an example of how to create a simple service account:

```bash
apiVersion: v1
kind: ServiceAccount
metadata:
  name: my-service-account
  namespace: default
```
#### This YAML defines a Service Account named my-service-account in the default namespace.

#### To create this Service Account, you would save the YAML to a file, let's say service-account.yaml, and then apply it with kubectl:

```bash
kubectl apply -f service-account.yaml

```
### Using a Service Account in a Pod:

```bash
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
spec:
  serviceAccountName: my-service-account
  containers:
  - name: my-container
    image: nginx
```
In this example, the Pod my-pod is configured to use the my-service-account service account. This means any interactions this Pod has with the Kubernetes API will be authenticated as this service account.

# Role and ClusterRole
An RBAC Role or ClusterRole contains rules that represent a set of permissions. Permissions are purely additive (there are no "deny" rules).

#### A Role always sets permissions within a particular namespace; when you create a Role, you have to specify the namespace it belongs in.

#### ClusterRole, by contrast, is a non-namespaced resource. The resources have different names (Role and ClusterRole) because a Kubernetes object always has to be either namespaced or not namespaced; it can't be both.

#### ClusterRoles have several uses. You can use a ClusterRole to:

- define permissions on namespaced resources and be granted access within individual namespace(s)
- define permissions on namespaced resources and be granted access across all namespaces
- define permissions on cluster-scoped resources
- If you want to define a role within a namespace, use a Role; if you want to define a role cluster-wide, use a ClusterRole.
#### How to check which reouces are name spaced and non spaces resources 
``` bash
# In a namespace
kubectl api-resources --namespaced=true

# Not in a namespace
kubectl api-resources --namespaced=false
```
### Role example
 Here's an example Role in the "default" namespace that can be used to grant read access to pods:
 ``` bash
 apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: default
  name: pod-reader
rules:
- apiGroups: [""] # "" indicates the core API group
  resources: ["pods"]
  verbs: ["get", "watch", "list"]
 ```

### ClusterRole example 
A ClusterRole can be used to grant the same permissions as a Role. Because ClusterRoles are cluster-scoped, you can also use them to grant access to:

- cluster-scoped resources (like nodes)

- non-resource endpoints (like /healthz)

- namespaced resources (like Pods), across all namespaces

``` bash
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  # "namespace" omitted since ClusterRoles are not namespaced
  name: secret-reader
rules:
- apiGroups: [""]
  #
  # at the HTTP level, the name of the resource for accessing Secret
  # objects is "secrets"
  resources: ["secrets"]
  verbs: ["get", "watch", "list"]
```

# RoleBinding and ClusterRoleBinding
A role binding grants the permissions defined in a role to a user or set of users. It holds a list of subjects (users, groups, or service accounts), and a reference to the role being granted. A RoleBinding grants permissions within a specific namespace whereas a ClusterRoleBinding grants that access cluster-wide.

### RoleBinding examples 
Here is an example of a RoleBinding that grants the "pod-reader" Role to the user "jane" within the "default" namespace. This allows "jane" to read pods in the "default" namespace.

``` bash 
apiVersion: rbac.authorization.k8s.io/v1
# This role binding allows "jane" to read pods in the "default" namespace.
# You need to already have a Role named "pod-reader" in that namespace.
kind: RoleBinding
metadata:
  name: read-pods
  namespace: default
subjects:
# You can specify more than one "subject"
- kind: User # ServiceAccount
  name: jane # "name" is case sensitive
  apiGroup: rbac.authorization.k8s.io
roleRef:
  # "roleRef" specifies the binding to a Role / ClusterRole
  kind: Role #this must be Role or ClusterRole
  name: pod-reader # this must match the name of the Role or ClusterRole you wish to bind to
  apiGroup: rbac.authorization.k8s.io
  ```
  ### ClusterRoleBinding example
  ``` bash
  apiVersion: rbac.authorization.k8s.io/v1
  # This cluster role binding allows anyone in the "manager" group to read secrets in any namespace.
  kind: ClusterRoleBinding
   metadata:
   name: read-secrets-global
  subjects:
  - kind: Group  # we can aslo use ServiceAccount
    name: manager # Name is case sensitive
    apiGroup: rbac.authorization.k8s.io
  roleRef:
   kind: ClusterRole
   name: secret-reader
   apiGroup: rbac.authorization.k8s.io
  ```
