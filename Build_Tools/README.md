# Build Tools


Build tools are software programs that help you automate the process of turning the source code into something you can actually use or run (like an app, a website, or a program) called deliverable artifacts.  

Imagine you’re a chef in a kitchen.  
- Ingredients: like your source code  
- Recipe: step-by-step instructions to turn those ingredients into a dish ( the build script )  
- Cooking: following the recipe, mixing, baking etc. ( when the build tool running the instructions.)   

But what if you had a robot chef (Gradle). You just tell the robot, "Make this dish," and it does all the steps for you. Chop, mix, bake, and even clean up! The build tool is that robot chef for your software project.  

In technical way Gradle does the follwoing  

- Collects the source code (ingredients)  
- Follows a recipe you define (the build script)  
- Does repetitive tasks like:    
    - Downloading any extra packages or libraries   
    - Running tests to make sure everything works well   
    - Packaging everything into a neat file (like a jar, war, or zip)  
    - Deploying or publishing your code  

---

#### Why do we use build tools  
- Saves time: Automates boring repetitive tasks.  
- Consistency: Everyone on the team gets the same results every time.  
- Easy integration: Fits well with CI/CD pipelines, so your app can be built, tested, and shipped automatically.  

---

#### In Summary  
Build tools like Gradle provide a structured, automated, and repeatable process for compiling, testing, and packaging software, enabling modern DevOps practices and scalable cloud-native application delivery.

------

### Gradle

#### Big Picture Workflow  
1- Write code: src/  
2- Configure build: build.gradle, settings.gradle  
3- Run Gradle commands: compile, test, package (build/)  
4- Get your app: JAR in build/libs/ (the artifact)  
5- Run/share your app: use the JAR file anywhere with Java  

#### Core Files & Folders
- src/	the source code and tests
- build.gradle	main Gradle config (dependencies, plugins, etc.)
- settings.gradle	Multi-project setup and root project settings
- .gradle/	Gradle’s internal cache/info
- build/	have all generated files: classes, reports, artifacts
    - classes:	compiled .class files
    - libs:	the final app as a .jar file
    - reports: test and code reports
    - test-results:	raw test results

Note that an artifact is any file produced by the build process that you use, share, or deploy.

