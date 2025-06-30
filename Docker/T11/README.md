## T11: Run Java Spring Boot App in a Container

- Clone the Application Code https://github.com/Ibrahim-Adel15/Docker-1.git
- Write Dockerfile.
    - Use Maven base image with java 17
    - Create work directory
    - Copy the application code into the container
    - Build the app using mvn package
    - Run the app on jar file located in target/demo-0.0.1-SNAPSHOT.jar
    - Expose port 8080
- Build Image.
- Run Container.
- Test the Application.
- Stop and delete the container.

write your own docker file

---

To read the Dockerfile and build a new image.
```
docker build -t mavenjava17pp .
docker image ls
```

Run a container with the just built image and connect your computer’s port 8080 to the app’s port 8080 inside the container, (-d) is to deattach from the terminal which means Docker starts the container in the background and keeps it running in the background  where you’ll just see the container ID printed on the terminal.  
```
docker run -d -p 8080:8080 mavenjava17app
```

Open the browser and visit `http://localhost:8080`

------

### Build the application first before write Dockerfile. 

Lets compare between building inside the container and another way which is to build outside the docker container  

First, creating an image where have the build inside the container  
The size of the image is `mavenjava17app   latest    93c80aa7a36b   25 minutes ago   664MB` while the size of the image that only used the JAR file as the build was outside the container is `theapp2   latest    39de2e422c50   5 minutes ago       288MB`

