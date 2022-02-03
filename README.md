# selenium-chromecolds
Website https://coldstorage.com.sg launched in chrome inside a VNC enabled selenium container


### How to use docker image
1. The single Dockerfile was used to package the docker image on Dockerhub
2. Use `enyiakwu/selenium-chromecolds:latest` to pull the image or visit the [repository here](https://hub.docker.com/layers/190520916/enyiakwu/selenium-chromecolds/latest/images/sha256-97b63a0c8c86ac1b1a51dca12dbd198cede3924e4bd2848d156a4de58e31c1e5?context=repo)

## Deploying the image
### Deploying to Docker
1. The images was successfully deployed to a docker host
2. Host is running on local machine and the container easily accessed with localhost:7900
3. Run the following docker run command to access the container:
`docker pull enyiakwu/selenium-chromecolds:latest`
`docker run -d --name chrome_colds -p 4444:4444 -p 7900:7900 --shm-size="2g" --net=host selenium-chromecolds-run:latest`
go to your browser and input localhost:7900

### Deploying to minikube
1. This was tested on minikube running on Docker and VirtualBox VM
2. Accessing it through web browser was unsuccessful
3. Challenge was observed with exposing the service for the minikube VM deployments
4. use this `minikube service coldstorage --url` to fetch the IP:PORT link
5. an ingress controller might be required for it to work


### Deploying to managed Kubernetes cluster
1. This was experimented on AWS EKS cluster
2. Yaml files in this repository is configured for using a LoadBalancer service type
