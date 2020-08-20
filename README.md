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

Для использования ansible dynamic inventory c GCE :

1. Создать Service Account (https://developers.google.com/identity/protocols/OAuth2ServiceAccount#creatinganaccount)
2. Скачать JSON credentials (https://support.google.com/cloud/answer/6158849?hl=en&ref_topic=6262490#serviceaccounts)
3. Скачать gce.py  gce.ini из гита ansible : https://github.com/ansible/ansible/tree/devel/contrib/inventory
4. Положить скачанное в директорию (например, ./inventory),указать в ansible.cfg : inventory = ./inventory
5. chmod +x gce.py
6. Заполнить gce.ini (" и ' использовать не нужно): 
		gce_service_account_email_address = данные из json
		gce_service_account_pem_file_path = /full_path_to_json(из пункта 2)
		gce_project_id =  данные из json
		
7. Проверка : ./gce.py --list 
8. Получение информации об инстансах: ansible all -m setup 

		
		
