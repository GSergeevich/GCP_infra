# infra
Infrastructure repo for  projects in GCP


gcloud compute instances create --boot-disk-size=10GB --image=reddit-base-1505470643 --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --zone=europe-west1-b --metadata-from-file startup-script=startup_script.sh reddit-app
