sudo apt update -y
                     
#To Install python dependencies
sudo apt install python3 -y
sudo apt install python3-flask  -y
sudo apt install python3-pymysql -y
sudo apt install python3-boto3  -y
                                                                         
sudo apt install mysql-client -y                                          #To Install Mysql-Client
sudo apt install python3-pymysql -y                                       #Python app connection to RDS

cd /home/ubuntu/
git clone https://github.com/Nikhil-tr/AWSProject1.git

#sudo nano config.py                                                      #Provide DB and S3 Credentials  
#mysql -h database-1.csbbg.ap-south-1.rds.amazonaws.com -u admin -p       #To-Connect to RDS
#show databases;
#create database projdb;                                                  #Create database on RDS
#use projdb;
#CREATE TABLE employee (emp_id VARCHAR(20), first_name VARCHAR(20),last_name VARCHAR(20),primary_skills VARCHAR(20), location VARCHAR(20));
                     
#sudo python3 EmpApp.py                                                    #To run python app
