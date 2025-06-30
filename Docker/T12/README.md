### T12: Multi-Stage Build for a Node.js App

- Clone the Application Code https://github.com/Ibrahim-Adel15/Docker-1.git 
- Write Dockerfile with Multi-stage.
    - Use Maven base image for first stag
    - Copy the application code into the container
    - Build the app using mvn package
    - Use java base image for second stag
    - Copy JAR file from first stag and expose port 8080
- Run the app
- Build Docker Image.
- Run the container.
- Test the Application.

---

### Why do we need multi-stage builds in Docker ?
Single-Stage docker builds use a single Dockerfile to build and run your Java app so you need both Maven to build the code and Java to run the app  
This means all the build tools (Maven, etc.) stay inside your final image which making it huge and full of unnecessary stuff and that makes it slower to download, upload, and start, increase security risk as more tools equals more things hackers can attack, and lastly there will be wasted space and resources.  

### How Multi Stage Fix this
With multi-stage builds:  
- First stage: Use an image with all the heavy build tools (like Maven).  
- Second stage: Start from a fresh, clean image (only Java runtime), and copy just the final built JAR into it.  

So we have the final image tiny as it just have the app and what’s needed to run it, no Maven and no source code just the JAR file  

Note that each stage in a multi-stage Dockerfile starts from its own base image so Stage 1 uses one base image (Maven) and Stage 2 uses another (Java runtime). BUT only the final stage is used as your actual application image where the earlier stages (the Maven build stage) are just temporary workspaces, Docker throws it away when it’s done.  

This means when you run your container only the second (final) image (Java runtime + the JAR) is actually used.

