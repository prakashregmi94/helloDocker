# helloDocker
This is a single container web app that uses express(Node.js) to display 'Demo of Node Application on Docker!', This can be hosted both locally and in AWS 
Following command lines can be used to play around docker 
1. Image Creation (local host):  
  docker  build -t <image-name>  . // create docker image with tag  
  docker  build -t <image-name>:v2  . // creates second version of image      
  docker build -t nodeapp -f Dockerfile.dev .  // to create image from different docker file     
  docker images // list created images   

2. Running a container with created image (local host):  
  docker run --name <container name> <image name>  // runs docker container with the image provided  
  docker run --name <container name> -p 8888:8888  <image name>  // maps local port : container port    
  docker run --name <container name>  -p 8888:8888 -v /${pwd}:/usr/src/app <image-name>  // binds the local volume to container /usr/src/app can be changed accordingly   
  docker run --name <container name> -p 8888:8888 -v /${pwd}:/usr/src/app  -v usr/src/app/node_modules <image-name>  // doesnt link node_modules    
  docker run --name <container name> -p 8888:8888 -v /${pwd}:/usr/src/app -v  <image-name>  
  docker exec -it <container name>  /bin/sh  // to shh to the container   
  docker container stop <container-name >  //stop running container  
  docker container ls // lists the containers   

// Running contianer with -d flag detach it form the terminal.  

3. Deploying app on AWS EC2   
Image creation:  
  Create a repo in ECR // ECR Elastic Container Registry : allows to store and push up our images   
  Download and install Aws Cli // Create user in IAM and save the credentials  
  Configure aws credentials from above, set the region same as ECR  // run aws configure in terminal or bash  
  Create image using 'View push commands' in ECR repo and push the image    
Deployment:   
  Create a ECS cluster with linux image //required 1 ec2 probably t2.medium, allow ipv4 in subnet setting // network setting leave default   
  Create a Task definition add a task for running container // map port 8888:8888  // get the image uri from the docker image pushed in image creation    
  Change security groups  to allow access of the docker exposed port (8888 for this app) from anywhere in ipv4 and ipv6  
  Run the service, check deplyment log for 'Server running on port: 8888'  
  Copy the ec2 public address append with :8888 access from the browser    

// todo   
4. Automate using Github Actions or Jenkins or Travis  
5. Kubernetes or minikube   
