### T13: Docker Environment Variables

- Clone the Application Code https://github.com/Ibrahim-Adel15/Docker-3.git
- Write Dockerfile
    - Use python image
    - Install flask
    - Expose port 8080
    - Run python command on app.py
- Build Docker Image
- Run container and set both environment variables (APP_MODE & APP_REGION) as following:
    - (development, us-east) as variables in the command when run docker container 
    - (staging, us-west) in a separate file and pass the file name in the command 
    - (production, canada-west) in the Dockerfile

---
#### Note that Environment variables let you control app behavior without changing code.
---
### Run the Container with Different Env Variables ordered in Precedence

#### 1- As Command Line Variables (last-minute or secure overrides)

When you want to override just for this run (container) or provide secrets from a CI/CD system via pipline (not stored on disk), it is great for scripts, automation, or when testing something quickly

Typical in:
- Production deployments (via orchestrators like Kubernetes, ECS, etc.)
- Automated scripts
- One-off or ad-hoc runs

```
docker run -p 8080:8080 -e APP_MODE=development -e APP_REGION=us-east flaskapp
```
---
#### 2- With a .env File (several teams)


Usually used to quickly switch multiple environments (dev, staging, test) without changing the Dockerfile or long commands as you keep different .env files for dev, test, and staging, also used to keep secrets/configuration separate from the Dockerfile

```
docker run -p 8080:8080 --env-file .env flaskapp
```
---
#### 3- ENV In Dockerfile (defaults)

When you set environment variables in the Dockerfile using ENV those values become the defaults for any container made from that image. It makes your image “just work” without needing extra setup. Used usally for public/shared images with safe defaults.

Check the [Dockerfile](../T13/Dockerfile) we have the variables defined so we just run
```
docker run -p 8080:8080 flaskapp
```
