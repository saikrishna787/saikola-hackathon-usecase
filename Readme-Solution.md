### Deploy 3 services to GKE 1 Java service (backend) & 2 Node Js service

##Infra Structure Provisioning  - Terraform
-> Enable IAM, network and other required apis if not enabled
-> Verify service account/ user access of the project
-> VPC - Terraform resources/module by google to provision google_compute_network simple vpc with private and public subnets

-> GKE - Provision a simple gke cluster using terraform resource with 3 nodes and add the above subnet created to the gke to allow network connectivity.

-> Create namespace
-> Create ingress
-> create load balancer

-> Create GCR / GAR Repository in GCP and assign permissions to sa to pull and push the gar
-> kubernetes manifests 
-> Workflow to validate, build and deploy terraform
-> Workflow to validate, build and deploy application, build docker file and push to gcr/gar
-> Workflow to validate, build and deploy kube manifests\


-> Create monitoring and alert

![](C:\Users\saikr\Downloads\Hackaton.png)