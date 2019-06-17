############################################################################################
#####                     Creating  Docker Image using Multi-stage builds             ######
############################################################################################

#Stage1
#Pull the  Base Image 
FROM python:3 as base 
#AUTHOR
LABEL "AUTHOR"="krishnamaram2@gmail.com"
# Create the user with name macuser
RUN useradd -m macuser 
USER macuser
#Configuring working directory 
WORKDIR /home/macuser 

#Stage2
FROM base 
#Copying the python program to working directory 
COPY ./macaddress.py /home/macuser
#Execute the program  
ENTRYPOINT ["python3", "macaddress.py"]
