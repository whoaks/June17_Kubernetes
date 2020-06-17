C:\Users\Akash>minikube status
minikube
type: Control Plane
host: Stopped
kubelet: Stopped
apiserver: Stopped
kubeconfig: Stopped

C:\Users\Akash>cd cc

C:\Users\Akash\CC>minikube start
* minikube v1.11.0 on Microsoft Windows 10 Pro 10.0.18362 Build 18362
* Using the virtualbox driver based on existing profile
* Starting control plane node minikube in cluster minikube
* Restarting existing virtualbox VM for "minikube" ...
* Preparing Kubernetes v1.18.3 on Docker 19.03.8 ...
! This VM is having trouble accessing https://k8s.gcr.io
* To pull new external images, you may need to configure a proxy: https://minikube.sigs.k8s.io/docs/reference/networking/proxy/
* Verifying Kubernetes components...
* Enabled addons: default-storageclass, storage-provisioner
* Done! kubectl is now configured to use "minikube"

C:\Users\Akash\CC>minikube status
minikube
type: Control Plane
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured


C:\Users\Akash\CC>kubectl get pods
No resources found in default namespace.

C:\Users\Akash\CC>kubectl create deployment aks --image=vimal13/apache-webserver-php
deployment.apps/aks created

C:\Users\Akash\CC>kubectl get pods
NAME                   READY   STATUS    RESTARTS   AGE
aks-7df4dc9f78-dsm2l   1/1     Running   0          12s

C:\Users\Akash\CC>kubectl get pods --show-labels
NAME                   READY   STATUS    RESTARTS   AGE   LABELS
aks-7df4dc9f78-dsm2l   1/1     Running   0          23s   app=aks,pod-template-hash=7df4dc9f78

C:\Users\Akash\CC>kubectl delete pods aks-7df4dc9f78-dsm2l
pod "aks-7df4dc9f78-dsm2l" deleted

C:\Users\Akash\CC>kubectl get pods
NAME                   READY   STATUS    RESTARTS   AGE
aks-7df4dc9f78-g7j2n   1/1     Running   0          93s

C:\Users\Akash\CC>kubectl delete all --all
pod "aks-7df4dc9f78-g7j2n" deleted
service "kubernetes" deleted
deployment.apps "aks" deleted
replicaset.apps "aks-7df4dc9f78" deleted

C:\Users\Akash\CC>kubectl get pods
No resources found in default namespace.

C:\Users\Akash\CC>kubectl create deployment chiku --image=vimal13/apache-webserver-php
deployment.apps/chiku created

C:\Users\Akash\CC>kubectl get pods
NAME                    READY   STATUS              RESTARTS   AGE
chiku-cd8c94b5f-dxg22   0/1     ContainerCreating   0          4s

C:\Users\Akash\CC>kubectl get pods
NAME                    READY   STATUS    RESTARTS   AGE
chiku-cd8c94b5f-dxg22   1/1     Running   0          7s

C:\Users\Akash\CC>kubectl get all
NAME                        READY   STATUS    RESTARTS   AGE
pod/chiku-cd8c94b5f-dxg22   1/1     Running   0          21s

NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
service/kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   5m25s

NAME                    READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/chiku   1/1     1            1           21s

NAME                              DESIRED   CURRENT   READY   AGE
replicaset.apps/chiku-cd8c94b5f   1         1         1       21s

C:\Users\Akash\CC>kubectl describe pods chiku-cd8c94b5f-dxg22
Name:         chiku-cd8c94b5f-dxg22
Namespace:    default
Priority:     0
Node:         minikube/192.168.99.100
Start Time:   Wed, 17 Jun 2020 20:31:25 +0530
Labels:       app=chiku
              pod-template-hash=cd8c94b5f
Annotations:  <none>
Status:       Running
IP:           172.17.0.4
IPs:
  IP:           172.17.0.4
Controlled By:  ReplicaSet/chiku-cd8c94b5f
Containers:
  apache-webserver-php:
    Container ID:   docker://2804b9b3eafd742c405a0e679d57d72ac2bb7df47102722bcd92606d5a650dd1
    Image:          vimal13/apache-webserver-php
    Image ID:       docker-pullable://vimal13/apache-webserver-php@sha256:faed0a5afaf9f04b6915d73f7247f6f5a71db9274ca44118d38f4601c0080a91
    Port:           <none>
    Host Port:      <none>
    State:          Running
      Started:      Wed, 17 Jun 2020 20:31:31 +0530
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from default-token-hpf7q (ro)
Conditions:
  Type              Status
  Initialized       True
  Ready             True
  ContainersReady   True
  PodScheduled      True
Volumes:
  default-token-hpf7q:
    Type:        Secret (a volume populated by a Secret)
    SecretName:  default-token-hpf7q
    Optional:    false
QoS Class:       BestEffort
Node-Selectors:  <none>
Tolerations:     node.kubernetes.io/not-ready:NoExecute for 300s
                 node.kubernetes.io/unreachable:NoExecute for 300s
Events:
  Type    Reason     Age   From               Message
  ----    ------     ----  ----               -------
  Normal  Scheduled  48s   default-scheduler  Successfully assigned default/chiku-cd8c94b5f-dxg22 to minikube
  Normal  Pulling    48s   kubelet, minikube  Pulling image "vimal13/apache-webserver-php"
  Normal  Pulled     42s   kubelet, minikube  Successfully pulled image "vimal13/apache-webserver-php"
  Normal  Created    42s   kubelet, minikube  Created container apache-webserver-php
  Normal  Started    42s   kubelet, minikube  Started container apache-webserver-php

C:\Users\Akash\CC>kubectl get pods
NAME                    READY   STATUS    RESTARTS   AGE
chiku-cd8c94b5f-dxg22   1/1     Running   0          2m

C:\Users\Akash\CC>kubectl delete pods chiku-cd8c94b5f-dxg22
pod "chiku-cd8c94b5f-dxg22" deleted

C:\Users\Akash\CC>kubectl get pods
NAME                    READY   STATUS    RESTARTS   AGE
chiku-cd8c94b5f-b74pv   1/1     Running   0          15s

C:\Users\Akash\CC>kubectl scale deployment chiku 3
Error: required flag(s) "replicas" not set

C:\Users\Akash\CC>kubectl scale deployment chiku-cd8c94b5f-b74pv 3
Error: required flag(s) "replicas" not set

C:\Users\Akash\CC>kubectl scale deployment chiku --help
Set a new size for a Deployment, ReplicaSet, Replication Controller, or StatefulSet.

 Scale also allows users to specify one or more preconditions for the scale action.

 If --current-replicas or --resource-version is specified, it is validated before the scale is attempted, and it is
guaranteed that the precondition holds true when the scale is sent to the server.

Examples:
  # Scale a replicaset named 'foo' to 3.
  kubectl scale --replicas=3 rs/foo

  # Scale a resource identified by type and name specified in "foo.yaml" to 3.
  kubectl scale --replicas=3 -f foo.yaml

  # If the deployment named mysql's current size is 2, scale mysql to 3.
  kubectl scale --current-replicas=2 --replicas=3 deployment/mysql

  # Scale multiple replication controllers.
  kubectl scale --replicas=5 rc/foo rc/bar rc/baz

  # Scale statefulset named 'web' to 3.
  kubectl scale --replicas=3 statefulset/web

Options:
      --all=false: Select all resources in the namespace of the specified resource types
      --allow-missing-template-keys=true: If true, ignore any errors in templates when a field or map key is missing in
the template. Only applies to golang and jsonpath output formats.
      --current-replicas=-1: Precondition for current size. Requires that the current size of the resource match this
value in order to scale.
  -f, --filename=[]: Filename, directory, or URL to files identifying the resource to set a new size
  -k, --kustomize='': Process the kustomization directory. This flag can't be used together with -f or -R.
  -o, --output='': Output format. One of:
json|yaml|name|go-template|go-template-file|template|templatefile|jsonpath|jsonpath-file.
      --record=false: Record current kubectl command in the resource annotation. If set to false, do not record the
command. If set to true, record the command. If not set, default to updating the existing annotation value only if one
already exists.
  -R, --recursive=false: Process the directory used in -f, --filename recursively. Useful when you want to manage
related manifests organized within the same directory.
      --replicas=0: The new desired number of replicas. Required.
      --resource-version='': Precondition for resource version. Requires that the current resource version match this
value in order to scale.
  -l, --selector='': Selector (label query) to filter on, supports '=', '==', and '!='.(e.g. -l key1=value1,key2=value2)
      --template='': Template string or path to template file to use when -o=go-template, -o=go-template-file. The
template format is golang templates [http://golang.org/pkg/text/template/#pkg-overview].
      --timeout=0s: The length of time to wait before giving up on a scale operation, zero means don't wait. Any other
values should contain a corresponding time unit (e.g. 1s, 2m, 3h).

Usage:
  kubectl scale [--resource-version=version] [--current-replicas=count] --replicas=COUNT (-f FILENAME | TYPE NAME)
[options]

Use "kubectl options" for a list of global command-line options (applies to all commands).

C:\Users\Akash\CC>kubectl scale deployment chiku  --replicas=5
deployment.apps/chiku scaled

C:\Users\Akash\CC>kubectl get pods
NAME                    READY   STATUS              RESTARTS   AGE
chiku-cd8c94b5f-6vstc   0/1     ContainerCreating   0          9s
chiku-cd8c94b5f-b74pv   1/1     Running             0          7m4s
chiku-cd8c94b5f-cn88r   0/1     ContainerCreating   0          9s
chiku-cd8c94b5f-r72l8   1/1     Running             0          9s
chiku-cd8c94b5f-rr289   0/1     ContainerCreating   0          9s

C:\Users\Akash\CC>kubectl get pods
NAME                    READY   STATUS              RESTARTS   AGE
chiku-cd8c94b5f-6vstc   0/1     ContainerCreating   0          14s
chiku-cd8c94b5f-b74pv   1/1     Running             0          7m9s
chiku-cd8c94b5f-cn88r   1/1     Running             0          14s
chiku-cd8c94b5f-r72l8   1/1     Running             0          14s
chiku-cd8c94b5f-rr289   0/1     ContainerCreating   0          14s

C:\Users\Akash\CC>kubectl get pods
NAME                    READY   STATUS              RESTARTS   AGE
chiku-cd8c94b5f-6vstc   1/1     Running             0          18s
chiku-cd8c94b5f-b74pv   1/1     Running             0          7m13s
chiku-cd8c94b5f-cn88r   1/1     Running             0          18s
chiku-cd8c94b5f-r72l8   1/1     Running             0          18s
chiku-cd8c94b5f-rr289   0/1     ContainerCreating   0          18s

C:\Users\Akash\CC>kubectl get pods
NAME                    READY   STATUS              RESTARTS   AGE
chiku-cd8c94b5f-6vstc   1/1     Running             0          21s
chiku-cd8c94b5f-b74pv   1/1     Running             0          7m16s
chiku-cd8c94b5f-cn88r   1/1     Running             0          21s
chiku-cd8c94b5f-r72l8   1/1     Running             0          21s
chiku-cd8c94b5f-rr289   0/1     ContainerCreating   0          21s

C:\Users\Akash\CC>kubectl get pods
NAME                    READY   STATUS    RESTARTS   AGE
chiku-cd8c94b5f-6vstc   1/1     Running   0          26s
chiku-cd8c94b5f-b74pv   1/1     Running   0          7m21s
chiku-cd8c94b5f-cn88r   1/1     Running   0          26s
chiku-cd8c94b5f-r72l8   1/1     Running   0          26s
chiku-cd8c94b5f-rr289   1/1     Running   0          26s

C:\Users\Akash\CC>kubectl get all
NAME                        READY   STATUS    RESTARTS   AGE
pod/chiku-cd8c94b5f-6vstc   1/1     Running   0          42s
pod/chiku-cd8c94b5f-b74pv   1/1     Running   0          7m37s
pod/chiku-cd8c94b5f-cn88r   1/1     Running   0          42s
pod/chiku-cd8c94b5f-r72l8   1/1     Running   0          42s
pod/chiku-cd8c94b5f-rr289   1/1     Running   0          42s

NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
service/kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   15m

NAME                    READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/chiku   5/5     5            5           9m56s

NAME                              DESIRED   CURRENT   READY   AGE
replicaset.apps/chiku-cd8c94b5f   5         5         5       9m56s

C:\Users\Akash\CC>kubectl delete pods chiku-cd8c94b5f-r72l8
pod "chiku-cd8c94b5f-r72l8" deleted

C:\Users\Akash\CC>kubectl get pods
NAME                    READY   STATUS    RESTARTS   AGE
chiku-cd8c94b5f-6vstc   1/1     Running   0          8m19s
chiku-cd8c94b5f-b74pv   1/1     Running   0          15m
chiku-cd8c94b5f-cn88r   1/1     Running   0          8m19s
chiku-cd8c94b5f-rr289   1/1     Running   0          8m19s
chiku-cd8c94b5f-sp9v6   1/1     Running   0          8s

C:\Users\Akash\CC>kubectl delete all
error: resource(s) were provided, but no name, label selector, or --all flag specified

C:\Users\Akash\CC>kubectl delete all --help
Delete resources by filenames, stdin, resources and names, or by resources and label selector.

 JSON and YAML formats are accepted. Only one type of the arguments may be specified: filenames, resources and names, or
resources and label selector.

 Some resources, such as pods, support graceful deletion. These resources define a default period before they are
forcibly terminated (the grace period) but you may override that value with the --grace-period flag, or pass --now to
set a grace-period of 1. Because these resources often represent entities in the cluster, deletion may not be
acknowledged immediately. If the node hosting a pod is down or cannot reach the API server, termination may take
significantly longer than the grace period. To force delete a resource, you must specify the --force flag. Note: only a
subset of resources support graceful deletion. In absence of the support, --grace-period is ignored.

 IMPORTANT: Force deleting pods does not wait for confirmation that the pod's processes have been terminated, which can
leave those processes running until the node detects the deletion and completes graceful deletion. If your processes use
shared storage or talk to a remote API and depend on the name of the pod to identify themselves, force deleting those
pods may result in multiple processes running on different machines using the same identification which may lead to data
corruption or inconsistency. Only force delete pods when you are sure the pod is terminated, or if your application can
tolerate multiple copies of the same pod running at once. Also, if you force delete pods the scheduler may place new
pods on those nodes before the node has released those resources and causing those pods to be evicted immediately.

 Note that the delete command does NOT do resource version checks, so if someone submits an update to a resource right
when you submit a delete, their update will be lost along with the rest of the resource.

Examples:
  # Delete a pod using the type and name specified in pod.json.
  kubectl delete -f ./pod.json

  # Delete resources from a directory containing kustomization.yaml - e.g. dir/kustomization.yaml.
  kubectl delete -k dir

  # Delete a pod based on the type and name in the JSON passed into stdin.
  cat pod.json | kubectl delete -f -

  # Delete pods and services with same names "baz" and "foo"
  kubectl delete pod,service baz foo

  # Delete pods and services with label name=myLabel.
  kubectl delete pods,services -l name=myLabel

  # Delete a pod with minimal delay
  kubectl delete pod foo --now

  # Force delete a pod on a dead node
  kubectl delete pod foo --force

  # Delete all pods
  kubectl delete pods --all

Options:
      --all=false: Delete all resources, including uninitialized ones, in the namespace of the specified resource types.
  -A, --all-namespaces=false: If present, list the requested object(s) across all namespaces. Namespace in current
context is ignored even if specified with --namespace.
      --cascade=true: If true, cascade the deletion of the resources managed by this resource (e.g. Pods created by a
ReplicationController).  Default true.
      --dry-run='none': Must be "none", "server", or "client". If client strategy, only print the object that would be
sent, without sending it. If server strategy, submit server-side request without persisting the resource.
      --field-selector='': Selector (field query) to filter on, supports '=', '==', and '!='.(e.g. --field-selector
key1=value1,key2=value2). The server only supports a limited number of field queries per type.
  -f, --filename=[]: containing the resource to delete.
      --force=false: If true, immediately remove resources from API and bypass graceful deletion. Note that immediate
deletion of some resources may result in inconsistency or data loss and requires confirmation.
      --grace-period=-1: Period of time in seconds given to the resource to terminate gracefully. Ignored if negative.
Set to 1 for immediate shutdown. Can only be set to 0 when --force is true (force deletion).
      --ignore-not-found=false: Treat "resource not found" as a successful delete. Defaults to "true" when --all is
specified.
  -k, --kustomize='': Process a kustomization directory. This flag can't be used together with -f or -R.
      --now=false: If true, resources are signaled for immediate shutdown (same as --grace-period=1).
  -o, --output='': Output mode. Use "-o name" for shorter output (resource/name).
      --raw='': Raw URI to DELETE to the server.  Uses the transport specified by the kubeconfig file.
  -R, --recursive=false: Process the directory used in -f, --filename recursively. Useful when you want to manage
related manifests organized within the same directory.
  -l, --selector='': Selector (label query) to filter on, not including uninitialized ones.
      --timeout=0s: The length of time to wait before giving up on a delete, zero means determine a timeout from the
size of the object
      --wait=true: If true, wait for resources to be gone before returning. This waits for finalizers.

Usage:
  kubectl delete ([-f FILENAME] | [-k DIRECTORY] | TYPE [(NAME | -l label | --all)]) [options]

Use "kubectl options" for a list of global command-line options (applies to all commands).

C:\Users\Akash\CC>kubectl delete all --all
pod "chiku-cd8c94b5f-6vstc" deleted
pod "chiku-cd8c94b5f-b74pv" deleted
pod "chiku-cd8c94b5f-cn88r" deleted
pod "chiku-cd8c94b5f-rr289" deleted
pod "chiku-cd8c94b5f-sp9v6" deleted
service "kubernetes" deleted
deployment.apps "chiku" deleted
replicaset.apps "chiku-cd8c94b5f" deleted

C:\Users\Akash\CC>kubectl get pods
No resources found in default namespace.

C:\Users\Akash\CC>kubectl run akashi --image=vimal13/apache-webserver-php
pod/akashi created

C:\Users\Akash\CC>kubectl get pods
NAME     READY   STATUS              RESTARTS   AGE
akashi   0/1     ContainerCreating   0          3s

C:\Users\Akash\CC>kubectl get pods
NAME     READY   STATUS              RESTARTS   AGE
akashi   0/1     ContainerCreating   0          5s

C:\Users\Akash\CC>kubectl get pods
NAME     READY   STATUS    RESTARTS   AGE
akashi   1/1     Running   0          6s

C:\Users\Akash\CC>kubectl get pods --show-labels
NAME     READY   STATUS    RESTARTS   AGE   LABELS
akashi   1/1     Running   0          24s   run=akashi

C:\Users\Akash\CC>kubectl delete pods akashi
pod "akashi" deleted

C:\Users\Akash\CC>kubectl get pods
No resources found in default namespace.

C:\Users\Akash\CC>kubectl run akashi --image=vimal13/apache-webserver-php
pod/akashi created

C:\Users\Akash\CC>kubectl get pods
NAME     READY   STATUS              RESTARTS   AGE
akashi   0/1     ContainerCreating   0          2s

C:\Users\Akash\CC>kubectl get pods --show-labels
NAME     READY   STATUS              RESTARTS   AGE   LABELS
akashi   0/1     ContainerCreating   0          4s    run=akashi

C:\Users\Akash\CC>kubectl delete pods akashi
pod "akashi" deleted

C:\Users\Akash\CC>kubectl run akashi --image=vimal13/apache-webserver-php
pod/akashi created

C:\Users\Akash\CC>kubectl get pods
NAME     READY   STATUS              RESTARTS   AGE
akashi   0/1     ContainerCreating   0          3s

C:\Users\Akash\CC>kubectl get pods --show-labels
NAME     READY   STATUS    RESTARTS   AGE   LABELS
akashi   1/1     Running   0          6s    run=akashi

C:\Users\Akash\CC>kubectl label pods akashi dc=gkp
pod/akashi labeled

C:\Users\Akash\CC>kubectl get pods --show-labels
NAME     READY   STATUS    RESTARTS   AGE   LABELS
akashi   1/1     Running   0          25s   dc=gkp,run=akashi

C:\Users\Akash\CC>kubectl get pods
NAME     READY   STATUS    RESTARTS   AGE
akashi   1/1     Running   0          77s

C:\Users\Akash\CC>dir
 Volume in drive C has no label.
 Volume Serial Number is 1203-8193

 Directory of C:\Users\Akash\CC

17-06-2020  00:32    <DIR>          .
17-06-2020  00:32    <DIR>          ..
16-06-2020  12:49    <DIR>          code_terraform
14-06-2020  02:12       804,421,632 Copy of rhel-7-server-additional-20180628.iso
14-06-2020  02:04     1,325,574,144 Copy of rhel-7.5-server-updates-20180628.iso
17-06-2020  00:32     4,617,928,704 Copy of rhel-server-7.5-x86_64-dvd.iso
14-06-2020  15:09     4,495,732,736 Copy of RHEL7OSP-13.0-20180628.2-x86_64.iso
03-06-2020  09:39            52,809 instancetypes.csv
02-06-2020  18:50         3,525,307 jq-win64.exe
08-06-2020  17:19             1,464 keyppk.ppk
15-06-2020  09:52                19 KNN.txt
14-06-2020  23:56        44,517,888 kubectl.exe
14-06-2020  23:14        24,149,698 minikube-installer.exe
12-06-2020  09:49               382 my-tera-key.pem
30-05-2020  14:58             1,428 myfirstkey.ppk
16-06-2020  23:00    <DIR>          Practicals_done_by_vimal_sir
06-06-2020  19:00         3,168,256 putty-64bit-0.73-installer.msi
06-06-2020  19:00           696,720 puttygen.exe
15-06-2020  09:40           672,288 RCS-654 Lab Viva questions.pdf
27-05-2020  16:54        53,187,912 terraform.exe
10-06-2020  21:34    <DIR>          terra_code
14-06-2020  20:52       107,331,088 VirtualBox-6.1.10-138449-Win.exe
16-06-2020  13:07        11,158,320 WinSCP-5.17.6-Setup.exe
              18 File(s) 11,492,120,795 bytes
               5 Dir(s)  27,795,283,968 bytes free

C:\Users\Akash\CC>cd .kube
The system cannot find the path specified.

C:\Users\Akash\CC>cd
C:\Users\Akash\CC

C:\Users\Akash\CC>cd..

C:\Users\Akash>dir
 Volume in drive C has no label.
 Volume Serial Number is 1203-8193

C:\Users\Akash\.kube>notepad config

C:\Users\Akash\.kube>cd..

C:\Users\Akash>cd cc

C:\Users\Akash\CC>cd code_terraform

C:\Users\Akash\CC\code_terraform>mkdir kubernetes1

C:\Users\Akash\CC\code_terraform>cd kubernetes1

C:\Users\Akash\CC\code_terraform\kubernetes1>notepad 1.tf

C:\Users\Akash\CC\code_terraform\kubernetes1>terraform init

Initializing the backend...

Initializing provider plugins...
- Checking for available provider plugins...
- Downloading plugin for provider "kubernetes" (hashicorp/kubernetes) 1.11.3...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.kubernetes: version = "~> 1.11"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

C:\Users\Akash\CC\code_terraform\kubernetes1>terraform validate
Success! The configuration is valid.


C:\Users\Akash\CC\code_terraform\kubernetes1>cd ..

C:\Users\Akash\CC\code_terraform>cd ..

C:\Users\Akash\CC>kubectl get pods
NAME     READY   STATUS    RESTARTS   AGE
akashi   1/1     Running   0          22m

C:\Users\Akash\CC>kubectl delete all --all
pod "akashi" deleted
service "kubernetes" deleted

C:\Users\Akash\CC>kubectl get pods
No resources found in default namespace.

C:\Users\Akash\CC>cd code_terraform

C:\Users\Akash\CC\code_terraform>cd kubernetes1

C:\Users\Akash\CC\code_terraform\kubernetes1>terraform apply

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # kubernetes_pod.pod1 will be created
  + resource "kubernetes_pod" "pod1" {
      + id = (known after apply)

      + metadata {
          + generation       = (known after apply)
          + name             = "akspod"
          + namespace        = "default"
          + resource_version = (known after apply)
          + self_link        = (known after apply)
          + uid              = (known after apply)
        }

      + spec {
          + automount_service_account_token  = false
          + dns_policy                       = "ClusterFirst"
          + host_ipc                         = false
          + host_network                     = false
          + host_pid                         = false
          + hostname                         = (known after apply)
          + node_name                        = (known after apply)
          + restart_policy                   = "Always"
          + service_account_name             = (known after apply)
          + share_process_namespace          = false
          + termination_grace_period_seconds = 30

          + container {
              + image                    = "vimal13/apache-webserver-php"
              + image_pull_policy        = (known after apply)
              + name                     = "mycon"
              + stdin                    = false
              + stdin_once               = false
              + termination_message_path = "/dev/termination-log"
              + tty                      = false

              + resources {
                  + limits {
                      + cpu    = (known after apply)
                      + memory = (known after apply)
                    }

                  + requests {
                      + cpu    = (known after apply)
                      + memory = (known after apply)
                    }
                }

              + volume_mount {
                  + mount_path        = (known after apply)
                  + mount_propagation = (known after apply)
                  + name              = (known after apply)
                  + read_only         = (known after apply)
                  + sub_path          = (known after apply)
                }
            }

          + image_pull_secrets {
              + name = (known after apply)
            }

          + volume {
              + name = (known after apply)

              + aws_elastic_block_store {
                  + fs_type   = (known after apply)
                  + partition = (known after apply)
                  + read_only = (known after apply)
                  + volume_id = (known after apply)
                }

              + azure_disk {
                  + caching_mode  = (known after apply)
                  + data_disk_uri = (known after apply)
                  + disk_name     = (known after apply)
                  + fs_type       = (known after apply)
                  + read_only     = (known after apply)
                }

              + azure_file {
                  + read_only   = (known after apply)
                  + secret_name = (known after apply)
                  + share_name  = (known after apply)
                }

              + ceph_fs {
                  + monitors    = (known after apply)
                  + path        = (known after apply)
                  + read_only   = (known after apply)
                  + secret_file = (known after apply)
                  + user        = (known after apply)

                  + secret_ref {
                      + name = (known after apply)
                    }
                }

              + cinder {
                  + fs_type   = (known after apply)
                  + read_only = (known after apply)
                  + volume_id = (known after apply)
                }

              + config_map {
                  + default_mode = (known after apply)
                  + name         = (known after apply)

                  + items {
                      + key  = (known after apply)
                      + mode = (known after apply)
                      + path = (known after apply)
                    }
                }

              + downward_api {
                  + default_mode = (known after apply)

                  + items {
                      + mode = (known after apply)
                      + path = (known after apply)

                      + field_ref {
                          + api_version = (known after apply)
                          + field_path  = (known after apply)
                        }

                      + resource_field_ref {
                          + container_name = (known after apply)
                          + quantity       = (known after apply)
                          + resource       = (known after apply)
                        }
                    }
                }

              + empty_dir {
                  + medium = (known after apply)
                }

              + fc {
                  + fs_type      = (known after apply)
                  + lun          = (known after apply)
                  + read_only    = (known after apply)
                  + target_ww_ns = (known after apply)
                }

              + flex_volume {
                  + driver    = (known after apply)
                  + fs_type   = (known after apply)
                  + options   = (known after apply)
                  + read_only = (known after apply)

                  + secret_ref {
                      + name = (known after apply)
                    }
                }

              + flocker {
                  + dataset_name = (known after apply)
                  + dataset_uuid = (known after apply)
                }

              + gce_persistent_disk {
                  + fs_type   = (known after apply)
                  + partition = (known after apply)
                  + pd_name   = (known after apply)
                  + read_only = (known after apply)
                }

              + git_repo {
                  + directory  = (known after apply)
                  + repository = (known after apply)
                  + revision   = (known after apply)
                }

              + glusterfs {
                  + endpoints_name = (known after apply)
                  + path           = (known after apply)
                  + read_only      = (known after apply)
                }

              + host_path {
                  + path = (known after apply)
                  + type = (known after apply)
                }

              + iscsi {
                  + fs_type         = (known after apply)
                  + iqn             = (known after apply)
                  + iscsi_interface = (known after apply)
                  + lun             = (known after apply)
                  + read_only       = (known after apply)
                  + target_portal   = (known after apply)
                }

              + local {
                  + path = (known after apply)
                }

              + nfs {
                  + path      = (known after apply)
                  + read_only = (known after apply)
                  + server    = (known after apply)
                }

              + persistent_volume_claim {
                  + claim_name = (known after apply)
                  + read_only  = (known after apply)
                }

              + photon_persistent_disk {
                  + fs_type = (known after apply)
                  + pd_id   = (known after apply)
                }

              + quobyte {
                  + group     = (known after apply)
                  + read_only = (known after apply)
                  + registry  = (known after apply)
                  + user      = (known after apply)
                  + volume    = (known after apply)
                }

              + rbd {
                  + ceph_monitors = (known after apply)
                  + fs_type       = (known after apply)
                  + keyring       = (known after apply)
                  + rados_user    = (known after apply)
                  + rbd_image     = (known after apply)
                  + rbd_pool      = (known after apply)
                  + read_only     = (known after apply)

                  + secret_ref {
                      + name = (known after apply)
                    }
                }

              + secret {
                  + default_mode = (known after apply)
                  + optional     = (known after apply)
                  + secret_name  = (known after apply)

                  + items {
                      + key  = (known after apply)
                      + mode = (known after apply)
                      + path = (known after apply)
                    }
                }

              + vsphere_volume {
                  + fs_type     = (known after apply)
                  + volume_path = (known after apply)
                }
            }
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

kubernetes_pod.pod1: Creating...
kubernetes_pod.pod1: Creation complete after 7s [id=default/akspod]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl get pods
NAME     READY   STATUS    RESTARTS   AGE
akspod   1/1     Running   0          17s

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl get all
NAME         READY   STATUS    RESTARTS   AGE
pod/akspod   1/1     Running   0          35s

NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
service/kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   6m2s

C:\Users\Akash\CC\code_terraform\kubernetes1>terraform destroy
kubernetes_pod.pod1: Refreshing state... [id=default/akspod]

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # kubernetes_pod.pod1 will be destroyed
  - resource "kubernetes_pod" "pod1" {
      - id = "default/akspod" -> null

      - metadata {
          - annotations      = {} -> null
          - generation       = 0 -> null
          - labels           = {} -> null
          - name             = "akspod" -> null
          - namespace        = "default" -> null
          - resource_version = "28770" -> null
          - self_link        = "/api/v1/namespaces/default/pods/akspod" -> null
          - uid              = "210b5164-4fbe-4b91-a1df-7be0dc208513" -> null
        }

      - spec {
          - active_deadline_seconds          = 0 -> null
          - automount_service_account_token  = false -> null
          - dns_policy                       = "ClusterFirst" -> null
          - host_ipc                         = false -> null
          - host_network                     = false -> null
          - host_pid                         = false -> null
          - node_name                        = "minikube" -> null
          - node_selector                    = {} -> null
          - restart_policy                   = "Always" -> null
          - service_account_name             = "default" -> null
          - share_process_namespace          = false -> null
          - termination_grace_period_seconds = 30 -> null

          - container {
              - args                     = [] -> null
              - command                  = [] -> null
              - image                    = "vimal13/apache-webserver-php" -> null
              - image_pull_policy        = "Always" -> null
              - name                     = "mycon" -> null
              - stdin                    = false -> null
              - stdin_once               = false -> null
              - termination_message_path = "/dev/termination-log" -> null
              - tty                      = false -> null

              - resources {
                }
            }
        }
    }

Plan: 0 to add, 0 to change, 1 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

kubernetes_pod.pod1: Destroying... [id=default/akspod]
kubernetes_pod.pod1: Destruction complete after 4s

Destroy complete! Resources: 1 destroyed.

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl get pods
No resources found in default namespace.

C:\Users\Akash\CC\code_terraform\kubernetes1>cd ..

C:\Users\Akash\CC\code_terraform>cd..

C:\Users\Akash\CC>kubectl get pods
No resources found in default namespace.

C:\Users\Akash\CC>cd code_terraform

C:\Users\Akash\CC\code_terraform>cd kubernetes1

C:\Users\Akash\CC\code_terraform\kubernetes1>terraform apply -auto-approve
kubernetes_pod.pod1: Creating...
kubernetes_pod.pod1: Still creating... [10s elapsed]
kubernetes_pod.pod1: Still creating... [20s elapsed]
kubernetes_pod.pod1: Creation complete after 23s [id=default/akspod]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl get pods
NAME     READY   STATUS    RESTARTS   AGE
akspod   1/1     Running   0          75s

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl get pods --show-labels
NAME     READY   STATUS    RESTARTS   AGE   LABELS
akspod   1/1     Running   0          83s   <none>

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl label pods akspod dc=gkp
pod/akspod labeled

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl get pods --show-labels
NAME     READY   STATUS    RESTARTS   AGE    LABELS
akspod   1/1     Running   0          115s   dc=gkp

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl label pods akspod env=up
pod/akspod labeled

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl get pods --show-labels
NAME     READY   STATUS    RESTARTS   AGE    LABELS
akspod   1/1     Running   0          2m8s   dc=gkp,env=up

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl run akspod2 --image=vimal13/apache-webserver-php
pod/akspod2 created

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl get pods --show-labels
NAME      READY   STATUS              RESTARTS   AGE    LABELS
akspod    1/1     Running             0          3m4s   dc=gkp,env=up
akspod2   0/1     ContainerCreating   0          4s     run=akspod2

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl get pods --show-labels
NAME      READY   STATUS              RESTARTS   AGE     LABELS
akspod    1/1     Running             0          3m12s   dc=gkp,env=up
akspod2   0/1     ContainerCreating   0          12s     run=akspod2

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl get pods --show-labels
NAME      READY   STATUS         RESTARTS   AGE    LABELS
akspod    1/1     Running        0          4m8s   dc=gkp,env=up
akspod2   0/1     ErrImagePull   0          68s    run=akspod2

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl get pods --show-labels
NAME      READY   STATUS             RESTARTS   AGE     LABELS
akspod    1/1     Running            0          4m24s   dc=gkp,env=up
akspod2   0/1     ImagePullBackOff   0          84s     run=akspod2

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl get pods --show-labels
NAME      READY   STATUS    RESTARTS   AGE     LABELS
akspod    1/1     Running   0          5m49s   dc=gkp,env=up
akspod2   1/1     Running   0          2m49s   run=akspod2

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl run akspod3 --image=vimal13/apache-webserver-php
pod/akspod3 created

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl get pods --show-labels
NAME      READY   STATUS              RESTARTS   AGE    LABELS
akspod    1/1     Running             0          6m5s   dc=gkp,env=up
akspod2   1/1     Running             0          3m5s   run=akspod2
akspod3   0/1     ContainerCreating   0          3s     run=akspod3

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl get pods --show-labels
NAME      READY   STATUS    RESTARTS   AGE     LABELS
akspod    1/1     Running   0          6m25s   dc=gkp,env=up
akspod2   1/1     Running   0          3m25s   run=akspod2
akspod3   1/1     Running   0          23s     run=akspod3

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl label pods akspod2 dc=gzb
pod/akspod2 labeled

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl label pods akspod3 dc=gkp
pod/akspod3 labeled

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl get pods --show-labels
NAME      READY   STATUS    RESTARTS   AGE     LABELS
akspod    1/1     Running   0          6m59s   dc=gkp,env=up
akspod2   1/1     Running   0          3m59s   dc=gzb,run=akspod2
akspod3   1/1     Running   0          57s     dc=gkp,run=akspod3

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl get pods -l dc=gkp
NAME      READY   STATUS    RESTARTS   AGE
akspod    1/1     Running   0          7m19s
akspod3   1/1     Running   0          77s

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl get pods -l env=up
NAME     READY   STATUS    RESTARTS   AGE
akspod   1/1     Running   0          7m36s

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl delete pods -l dc=gkp
pod "akspod" deleted
pod "akspod3" deleted

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl get pods
NAME      READY   STATUS    RESTARTS   AGE
akspod2   1/1     Running   0          5m27s

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl describe pods akspod2
Name:         akspod2
Namespace:    default
Priority:     0
Node:         minikube/192.168.99.100
Start Time:   Wed, 17 Jun 2020 21:56:18 +0530
Labels:       dc=gzb
              run=akspod2
Annotations:  <none>
Status:       Running
IP:           172.17.0.5
IPs:
  IP:  172.17.0.5                            kubectl get pods
NAME      READY   STATUS    RESTARTS   AGE
akspod2   1/1     Running   0          9m7s
    Container ID:   docker://2cffd5a37ae4b84a487981601f78bd086f2ab60d70056adebab6b53fea2ad04C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl --help
kubectl controls the Kubernetes cluster manager.
    Image ID:       docker-pullable://vimal13/apache-webserver-php@sha256:faed0a5afaf9f04b69 Find more information at:4118d38f4601c0080a91
https://kubernetes.io/docs/reference/kubectl/overview/
    Host Port:      <none>
Basic Commands (Beginner):g
  create        Create a resource from a file or from stdin.
  expose        Take a replication controller, service, deployment or pod and
expose it as a new Kubernetes Service
  run           Run a particular image on the cluster
  set           Set specific features on objects
      /var/run/secrets/kubernetes.io/serviceaccount from default-token-hpf7q (ro)
Basic Commands (Intermediate):
  explain       Documentation of resources
  get           Display one or many resources
  edit          Edit a resource on the server
  delete        Delete resources by filenames, stdin, resources and names, or by
resources and label selector
Volumes:
Deploy Commands:hpf7q:
  rollout       Manage the rollout of a resource Secret)
  scale         Set a new size for a Deployment, ReplicaSet or Replication
Controlleral:    false
  autoscale     Auto-scale a Deployment, ReplicaSet, or ReplicationController
Node-Selectors:  <none>
Cluster Management Commands:etes.io/not-ready:NoExecute for 300s
  certificate   Modify certificate resources.le:NoExecute for 300s
  cluster-info  Display cluster info
  top           Display Resource (CPU/Memory/Storage) usage.    Message
  cordon        Mark node as unschedulable   ----               -------
  uncordon      Mark node as schedulable     default-scheduler  Successfully assigned defaul  drain         Drain node in preparation for maintenance
  taint         Update the taints on one or more nodesminikube  Failed to pull image "vimal13/apache-webserver-php": rpc error: code = Unknown desc = Error response from daemon: Get htTroubleshooting and Debugging Commands:pache-webserver-php/manifests/latest: Get https://aut  describe      Show details of a specific resource or group of resourcesl&service=registry.  logs          Print the logs for a container in a podxceeded while awaiting headers)
  attach        Attach to a running containerkubelet, minikube  Failed to pull image "vimal1  exec          Execute a command in a containerwn desc = Error response from daemon: Get ht  port-forward  Forward one or more local ports to a poded (Client.Timeout exceeded while aw  proxy         Run a proxy to the Kubernetes API server
  cp            Copy files and directories to and from containers.iled to pull image "vimal1  auth          Inspect authorizationode = Unknown desc = Error response from daemon: Get https://registry-1.docker.io/v2/vimal13/apache-webserver-php/manifests/latest: Get https://autAdvanced Commands:scope=repository%3Avimal13%2Fapache-webserver-php%3Apull&service=registry.  diff          Diff live version against would-be applied version
  apply         Apply a configuration to a resource by filename or stdinrrImagePull
  patch         Update field(s) of a resource using strategic merge patchpulling image "vima  replace       Replace a resource by filename or stdin
  wait          Experimental: Wait for a specific condition on one or manygePullBackOff
resources. Pulling    3m22s (x4 over 5m49s)  kubelet, minikube  Pulling image "vimal13/apach  convert       Convert config files between different API versions
  kustomize     Build a kustomization target from a directory or a remote url.ulled image "vimal13/apache-webserver-php"
Settings Commands:    3m14s                  kubelet, minikube  Created container akspod2
  label         Update the labels on a resourcebelet, minikube  Started container akspod2
  annotate      Update the annotations on a resource
  completion    Output shell completion code for the specified shell (bash or
zsh)          READY   STATUS    RESTARTS   AGE
pod/akspod2   1/1     Running   0          7m32s
Other Commands:
  alpha         Commands for features in alphaEXTERNAL-IP   PORT(S)   AGE
  api-resources Print the supported API resources on the server/TCP   43m
  api-versions  Print the supported API versions on the server, in the form of
"group/version"CC\code_terraform\kubernetes1>
  config        Modify kubeconfig files
  plugin        Provides utilities for interacting with plugins.
  version       Print the client and server version information

Usage:
  kubectl [flags] [options]

Use "kubectl <command> --help" for more information about a given command.
Use "kubectl options" for a list of global command-line options (applies to all
commands).

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl --htlp
Error: unknown flag: --htlp
See 'kubectl --help' for usage.

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl run akspod4 --image=vimal13/apache-webserver-php
pod/akspod4 created

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl label pods akspod4 dc=gkp
pod/akspod4 labeled

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl get pods --show-labels
NAME      READY   STATUS              RESTARTS   AGE   LABELS
akspod2   1/1     Running             0          10m   dc=gzb,run=akspod2
akspod4   0/1     ContainerCreating   0          15s   dc=gkp,run=akspod4

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl get pods --show-labels
NAME      READY   STATUS    RESTARTS   AGE    LABELS
akspod2   1/1     Running   0          12m    dc=gzb,run=akspod2
akspod4   1/1     Running   0          119s   dc=gkp,run=akspod4

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl run akspod5 --image=vimal13/apache-webserver-php
pod/akspod5 created

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl get pods --show-labels
NAME      READY   STATUS              RESTARTS   AGE     LABELS
akspod2   1/1     Running             0          12m     dc=gzb,run=akspod2
akspod4   1/1     Running             0          2m24s   dc=gkp,run=akspod4
akspod5   0/1     ContainerCreating   0          6s      run=akspod5

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl label pods akspod5 dc=gkp
pod/akspod5 labeled

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl get pods --show-labels
NAME      READY   STATUS    RESTARTS   AGE     LABELS
akspod2   1/1     Running   0          13m     dc=gzb,run=akspod2
akspod4   1/1     Running   0          2m42s   dc=gkp,run=akspod4
akspod5   1/1     Running   0          24s     dc=gkp,run=akspod5

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl label pods akspod2 env=the_wall
pod/akspod2 labeled

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl label pods akspod4 env=winterfell
pod/akspod4 labeled

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl label pods akspod5 env=winterfell
pod/akspod5 labeled

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl get pods --show-labels
NAME      READY   STATUS    RESTARTS   AGE     LABELS
akspod2   1/1     Running   0          15m     dc=gzb,env=the_wall,run=akspod2
akspod4   1/1     Running   0          5m31s   dc=gkp,env=winterfell,run=akspod4
akspod5   1/1     Running   0          3m13s   dc=gkp,env=winterfell,run=akspod5

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl run akspod6 --image=vimal13/apache-webserver-php
pod/akspod6 created

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl label pods akspod6 env=winterfell
pod/akspod6 labeled

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl label pods akspod6 dc=delhi
pod/akspod6 labeled

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl get pods --show-labels
NAME      READY   STATUS    RESTARTS   AGE     LABELS
akspod2   1/1     Running   0          17m     dc=gzb,env=the_wall,run=akspod2
akspod4   1/1     Running   0          7m10s   dc=gkp,env=winterfell,run=akspod4
akspod5   1/1     Running   0          4m52s   dc=gkp,env=winterfell,run=akspod5
akspod6   1/1     Running   0          27s     dc=delhi,env=winterfell,run=akspod6

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl get pods --selector dc=gkp
NAME      READY   STATUS    RESTARTS   AGE
akspod4   1/1     Running   0          8m26s
akspod5   1/1     Running   0          6m8s

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl get pods --selector dc=gkp --show-labels
NAME      READY   STATUS    RESTARTS   AGE     LABELS
akspod4   1/1     Running   0          8m37s   dc=gkp,env=winterfell,run=akspod4
akspod5   1/1     Running   0          6m19s   dc=gkp,env=winterfell,run=akspod5

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl get pods --selector dc=gkp , env=the_wwall --show-labels
error: name cannot be provided when a selector is specified

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl get pods --selector dc=gkp,env=the_wwall --show-labels
No resources found in default namespace.

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl get pods --selector 'dc in (gkp,delhi)' --show-labels
error: name cannot be provided when a selector is specified

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl get pods --selector "dc in (gkp,delhi)" --show-labels
NAME      READY   STATUS    RESTARTS   AGE     LABELS
akspod4   1/1     Running   0          11m     dc=gkp,env=winterfell,run=akspod4
akspod5   1/1     Running   0          8m57s   dc=gkp,env=winterfell,run=akspod5
akspod6   1/1     Running   0          4m32s   dc=delhi,env=winterfell,run=akspod6

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl get pods --selector "dc in (gkp,delhi),env=winterfell" --show-labels
NAME      READY   STATUS    RESTARTS   AGE     LABELS
akspod4   1/1     Running   0          11m     dc=gkp,env=winterfell,run=akspod4
akspod5   1/1     Running   0          9m21s   dc=gkp,env=winterfell,run=akspod5
akspod6   1/1     Running   0          4m56s   dc=delhi,env=winterfell,run=akspod6

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl get pods --selector "dc in (gkp,gzb),env=winterfell" --show-labels
NAME      READY   STATUS    RESTARTS   AGE     LABELS
akspod4   1/1     Running   0          11m     dc=gkp,env=winterfell,run=akspod4
akspod5   1/1     Running   0          9m31s   dc=gkp,env=winterfell,run=akspod5

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl get pods --show-labels
NAME      READY   STATUS    RESTARTS   AGE     LABELS
akspod2   1/1     Running   0          22m     dc=gzb,env=the_wall,run=akspod2
akspod4   1/1     Running   0          12m     dc=gkp,env=winterfell,run=akspod4
akspod5   1/1     Running   0          9m43s   dc=gkp,env=winterfell,run=akspod5
akspod6   1/1     Running   0          5m18s   dc=delhi,env=winterfell,run=akspod6

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl get pods --selector "dc in (gkp,gzb),env=the_wall" --show-labels
NAME      READY   STATUS    RESTARTS   AGE   LABELS
akspod2   1/1     Running   0          22m   dc=gzb,env=the_wall,run=akspod2

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl delete pods -l dc=gkp
pod "akspod4" deleted
pod "akspod5" deleted

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl get pods
NAME      READY   STATUS    RESTARTS   AGE
akspod2   1/1     Running   0          23m
akspod6   1/1     Running   0          6m2s

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl delete all --all
pod "akspod2" deleted
pod "akspod6" deleted
service "kubernetes" deleted

C:\Users\Akash\CC\code_terraform\kubernetes1>kubectl get pods
No resources found in default namespace.

C:\Users\Akash\CC\code_terraform\kubernetes1>cd..

C:\Users\Akash\CC\code_terraform>mkdir kubernetes2

C:\Users\Akash\CC\code_terraform>cd kubernetes2

C:\Users\Akash\CC\code_terraform\kubernetes2>notepad k8s.yml

C:\Users\Akash\CC\code_terraform\kubernetes2>kubectl create -f k8s.yml
error: error validating "k8s.yml": error validating data: apiVersion not set; if you choose to ignore these errors, turn validation off with --validate=false

C:\Users\Akash\CC\code_terraform\kubernetes2>kubectl create -f k8s.yml
error: error validating "k8s.yml": error validating data: ValidationError(ReplicationController.spec.template.metadata): unknown field "spec" in io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta; if you choose to ignore these errors, turn validation off with --validate=false

C:\Users\Akash\CC\code_terraform\kubernetes2>kubectl create -f k8s.yml
error: error validating "k8s.yml": error validating data: ValidationError(ReplicationController.spec.template.metadata): unknown field "spec" in io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta; if you choose to ignore these errors, turn validation off with --validate=false

C:\Users\Akash\CC\code_terraform\kubernetes2>kubectl create -f k8s.yml
replicationcontroller/rc1 created

C:\Users\Akash\CC\code_terraform\kubernetes2>kubectl get pods
NAME        READY   STATUS              RESTARTS   AGE
rc1-48vqp   0/1     ContainerCreating   0          16s
rc1-58ds8   0/1     ContainerCreating   0          16s
rc1-x29k8   1/1     Running             0          16s

C:\Users\Akash\CC\code_terraform\kubernetes2>kubectl get pods --show-labels
NAME        READY   STATUS    RESTARTS   AGE     LABELS
rc1-48vqp   1/1     Running   0          3m52s   app=server,dc=north,env=the_wall
rc1-58ds8   1/1     Running   0          3m52s   app=server,dc=north,env=the_wall
rc1-x29k8   1/1     Running   0          3m52s   app=server,dc=north,env=the_wall

C:\Users\Akash\CC\code_terraform\kubernetes2>kubectl delete pods rc1-48vqp
pod "rc1-48vqp" deleted

C:\Users\Akash\CC\code_terraform\kubernetes2>kubectl get all
NAME            READY   STATUS    RESTARTS   AGE
pod/rc1-58ds8   1/1     Running   0          4m43s
pod/rc1-s2v5p   1/1     Running   0          26s
pod/rc1-x29k8   1/1     Running   0          4m43s

NAME                        DESIRED   CURRENT   READY   AGE
replicationcontroller/rc1   3         3         3       4m44s

NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
service/kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   31m

C:\Users\Akash\CC\code_terraform\kubernetes2>kubectl get pods --show-labels
NAME        READY   STATUS    RESTARTS   AGE     LABELS
rc1-58ds8   1/1     Running   0          5m15s   app=server,dc=north,env=the_wall
rc1-s2v5p   1/1     Running   0          58s     app=server,dc=north,env=the_wall
rc1-x29k8   1/1     Running   0          5m15s   app=server,dc=north,env=the_wall

C:\Users\Akash\CC\code_terraform\kubernetes2>kubectl delete all --all
pod "rc1-58ds8" deleted
pod "rc1-s2v5p" deleted
pod "rc1-x29k8" deleted
replicationcontroller "rc1" deleted
service "kubernetes" deleted
