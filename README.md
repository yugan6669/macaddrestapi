Project Title
=====================

Application for fetching  the Company Name associated with respective MAC address using the API.


Technologies 
=====================
Programming Language: Python

Scripting language: Bash scripting

Containerization tool: Docker

Infrastructure Tool: Packer 

Configuration Managenent tool: Ansible


Pre-Requisites
=========================
Linux Operating System

Install python3

Install Docker


Implementation and Execution Process
===================

Step 1: Generate an API key to query the result from the website https://macaddress.io/ 

Step 2: Implemeted Python program to fetch Data like Company Name and Country code for respective MAC Address

                           $python3 macaddress.py <API_KEY> <MAC_ADDRESS>
                          
Step 3: Containerized Application using multi-stage builds to improve Maintainability and readability

                           $docker build -t <Tag-Name>  .
                           $docker container run -it <Image-Id>/<Tag-Name> <API_KEY> <MAC_ADDRESS>


Step 4: Writing Bash script to build the Docker image and run the container as well

 case1: To be obtained the Company Name For the respective MAC Addresses, run the below command  
 
                           $bash macaddress.sh
                           Please Enter  Your API Key: <API_KEY>
 case2: If the macaddress.txt file not exist or file is empty, then it will prompt you  to enter the API Key and MAC Address
 
                           $bash macaddress.sh
                           Please Enter  Your API Key: <API_KEY>
                           Please Enter your MAC Address: <MAC_ADDRESS>
                           
   In the above all steps The output looks like :
 
MAC Address        :    44:38:39:ff:ef:57

Company Name       :    Cumulus Networks, Inc

Company Address    :    650 Castro Street, suite 120-245 Mountain View  CA  94041 US

Country code       :    US

                                          

Work is under Progress(Building Docker Image using Packer)      
============================================================
Created Custom Amazon Machine Image for the above Application to quickly create new running machines
using Packer

Automated installing Docker and Cloning Git repo using Ansible while building Custom Machine Image

Custom Machine Image contains a pre-configured Operating System and Installed softwares like Docker and cloning Git repo

$./packer build  -var-file=variables.json -var 'access_key=value' -var 'secret_key=value ' template.json

After EC2 Instance launched,run the below command to execute the application

                          $bash macaddress.sh
                          Please Enter  Your API Key: <API_KEY>
                          Please Enter your MAC Address: <MAC_ADDRESS>
                         
