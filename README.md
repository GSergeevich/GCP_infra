# infra
Infrastructure repo for  projects in GCP

To manually create instance with bash startup script deploy,run:

gcloud compute instances create --boot-disk-size=10GB --image=reddit-base-1505470643 --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --zone=europe-west1-b --metadata-from-file startup-script=startup_script.sh reddit-app

To create instance image with installed MongoDB and Ruby,run:

packer build -var "project_id=%your_project_here%" -var "source_image=%your_source_image_here%" packer/ubuntu16.json 


