### Deploy 3 services to GKE 1 Java service (backend) & 2 Node Js service

##Infra Structure Provisioning  - Terraform
-> Enable IAM, network and other required apis if not enabled
-> Verify service account/ user access of the project
-> VPC - Terraform resources/module by google to provision google_compute_network simple vpc with private and public subnets

#Plan - GKE - Provision a simple gke cluster using terraform resource with 3 nodes and add the above subnet created to the gke to allow network connectivity.
-> Create namespace
-> Create ingress
-> create load balancer

-> Create GCR / GAR Repository in GCP and assign permissions to sa to pull and push the gar
-> kubernetes manifests 
-> Workflow to validate, build and deploy terraform - vpc, gke, bucket,service account, iam perms
-> Workflow to validate, build and deploy application, build docker file and push to gcr/gar
-> Workflow to validate, build and deploy kube manifests


-> Create monitoring and alert


# Architecture Digram
<img width="4546" height="1527" alt="Hackaton" src="https://github.com/user-attachments/assets/523b3d50-f8b7-44da-bb4a-bb0003855871" />


#==================================================================================

Implementation:
Service account created
Terraform state bucket created
VPC Deployed using terraform and github actions
Application code has been containerized and pushed to GAR

## Terraform Deployment pipeline
https://github.com/saikrishna787/saikola-hackathon-usecase/actions/workflows/terraform-deploy.yaml
<img width="1277" height="660" alt="image" src="https://github.com/user-attachments/assets/49cb0e13-ac8f-49c8-a660-2e6f5836c900" />

## Apps build and pushed to GOOGLE Artifact Repository(GAR) using Github Actions
https://github.com/saikrishna787/saikola-hackathon-usecase/actions
<img width="1280" height="694" alt="image" src="https://github.com/user-attachments/assets/8023cf90-86f4-4883-9604-992323f2a6be" />

## Images Pushed to GAR
<img width="1022" height="358" alt="image" src="https://github.com/user-attachments/assets/66912a03-ee08-4bef-8354-ff8b286502f3" />

## Deployed VPC in GCP and stored state file in Bucket
<img width="1246" height="532" alt="image" src="https://github.com/user-attachments/assets/373442ef-0e93-4eb7-9bbc-012c0df23e59" />

