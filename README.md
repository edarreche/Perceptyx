# Perceptyx

## Install Docker & git :

Install Docker Engine and git
On a Linux terminal Run:
```
sudo apt-get install docker git
```

Install docker-compose
On a Linux termina Run:
```
sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s  /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo docker-compose --version
```

## Checkout the project
On a Linux terminall run :
```
git clone git@github.com:edarreche/Perceptyx.git
```

then step into the Project :
```
cd Perceptyx
```

## Create the environment
On a Linux terminal run :
```
docker-compose up
```

It might take several Minutes to created the ENV and be ready to serve Content, please be patient.
It will be ready when you see the following output
```
web_1    | PLAY RECAP *********************************************************************
web_1    | localhost                  : ok=28   changed=20   unreachable=0    failed=0   
```

## Access the App
On a browser access the url "localhost", there you will see the App

## Destroy the environment
on a Linux terminal run :
```
docker-compose down
```
