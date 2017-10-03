# infra
Infrastructure repo for  projects in GCP

To manually create instance with bash startup script deploy,run:

gcloud compute instances create --boot-disk-size=10GB --image=reddit-base-1505470643 --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --zone=europe-west1-b --metadata-from-file startup-script=startup_script.sh reddit-app

To create instance image with installed MongoDB and Ruby,run:

packer build -var "project_id=%your_project_here%" -var "source_image=%your_source_image_here%" packer/ubuntu16.json 

Заметки по использованию terraform

В main.tf описана либо напрямую конфигурация инфраструктуры,либо пути к модулям.Обязательным является описание провайдера.
В outputs.tf описаны переменные,которые будут получены из созданной в результате работы terraform инфраструктуры (ip адреса,etc).
В terraform.tfstate хранится текущая конфигурация инфраструктуры,исходя из которой при terraform plan вычисляются необходимые действия для приведения состояния в целевое.
В variables.tf описаны переменные,которые используются в описаниях инфраструктуры,в terraform.tfvars находятся эти значения переменных.
