# hello-world


### Command for local development
- CREATE LOCAL VIRTUAL ENVIRONMENT --> `conda create -n <env_name> python=3.9`  
- ACTIVATE VIRTUAL ENVIRONMENT --> `conda activate <env_name>`  
- EXPORT ALL THE ENVIRONMENT VARIABLES --> `source <env_file_path>`  
- RUN THE MAIN SHELL SCRIPT --> `cd src && .main.sh` or `cd src && source main.sh`  
- EXPORT ENV VARIABLES AND RUN THE SCRIPT WITH SINGLE COMMAND --> `eval $(cat ../config/staging.env) bash main.sh`  
  
### Command for local deployment
- BUILD DOCKERFILE --> `DOCKER_BUILDKIT=0 docker build -t <image_name> .`  
- RUN IMAGE  --> `docker run -it -p <local_port:container_port> --env-file <file_path> --name <container_name> image_name`  

### Push docker image to registry
- Local registry -->
- Docker Hub -->

### Commands for  k8s deployment
- CONFIGMAP :
  -`kubectl create configmap <config_name> --from-file=<file_path>`  
- ADD DEPLOYMENT : A deployment is responsible for keeping a set of pods running.  
  -`kubectl apply -f <deployment_file_path>`  
- SERVICE : A service is responsible for enabling network access to a set of pods.  
  -`kubectl apply -f <service_file_path>`  
- HPA :
  -`kubectl apply -f <hpa_file_path>`  



### Test k8s deployment locally 
Port forward for the service which has been deployed to k8s with one of the following commands:  
- `kubectl port-forward service/<service_name> <local_port:k8s_port>`  
- `kubectl port-forward deployment/<deployement_name> <local_port:k8s_port>`  

Refer to  [Fast API Deployment in K8s](https://techtalkverse.com/post/software-engineering/k8s_deployement/) blog for fast api to  K8s deployment steps.