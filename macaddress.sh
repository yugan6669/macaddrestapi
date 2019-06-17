##########################################################################################
#####               Wrapper script to run Containerized application                  #####
##########################################################################################
#!/bin/bash
arg=``
case $@ in
$arg)
     echo -e "\n"
     read -p "Please Enter  Your API Key: "  API_KEY
     echo -e "\n"
     if [ ! -f macaddress.txt ]; then
       read -p "Please Enter your MAC Address: "  MAC_ADDRESS
       echo -e "\n \n \n"
       #Build the Image using  Dockerfile
       echo -e "Docker Image creation and running the container is under progress...\n"
       docker image  build -t mac_addr . > /dev/null 2>&1
       #Run the container and pass API_KEY and MAC_ADDRESS as arguments
       docker container run  mac_addr $API_KEY $MAC_ADDRESS
       echo -e "\n \n \n"
     else
         for MAC_ADDRESS in `cat macaddress.txt`;
            do
            #Build the Image using  Dockerfile
            echo -e "Docker Image creation and running the container is under progress...\n"
            docker image  build -t mac_addr . > /dev/null 2>&1
            #Run the container and pass API_KEY and MAC_ADDRESS as arguments
            docker container run -it mac_addr $API_KEY $MAC_ADDRESS
            echo -e "\n \n \n"
            done
     fi
   ;;
*)
    echo "$(cat README.md)"
;;
esac
