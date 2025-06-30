
## T9: Gradle Installation and Build Java App

- Install Gradle.
- Clone source code [github.com/Ibrahim-Adel15/build1.git](https://github.com/Ibrahim-Adel15/build1.git)
- Run Unit test.
- Build App [ generate Artifact (build/libs/ivolve-app.jar)]. Run App.
- Verify App is working.


---

### Gradle Installation

We need java as it's required by gradle

```
sudo apt install openjdk-17-jdk -y
```

Download gradle

```
mkdir mnt/d/SharedVMs/gradle
cd mnt/d/SharedVMs/gradle
wget https://services.gradle.org/distributions/gradle-8.14.2-all.zip
unzip gradle-8.14.2-all.zip
```
Here I used a directory called SharedVMs as it's shared and mounted on several virtual machines so it'll be easier to configure later on.  

Configure your system environment so that Gradle can be accessed globally (system wide) from any terminal session by adding its location to the system’s PATH.

```
echo 'export GRADLE_HOME=/mnt/d/SharedVMs/gradle/gradle-8.7' >> ~/.bashrc
```
This sets the `GRADLE_HOME` environment variable to where Gradle installation exists then appending to `~/.bashrc` ensures the setting will be applied every time you start a new session.

```
echo 'export PATH=$PATH:$GRADLE_HOME/bin' >> ~/.bashrc
```
This adds the `bin` directory inside your Gradle folder to the system PATH so it lets you use the gradle command from any directory without needing the full path.

```
source ~/.bashrc
```
This reloads your `.bashrc`  so the changes take effect immediately where no reboot or logout needed.

```
gradle -v
```
This checks if Gradle is recognized and prints its version.  

------

### Run Unit test

```
cd build1
gradle test
```
Gradle finds test classes in [src/test/java/com/ivolve/AppTest.java](../T9/build1/src/test/java/com/ivolve/AppTest.java) and runs them, it compiles test code and main code.  
In the console you'll see a summary of passed/failed tests while there'll be detailed report in [build/reports/tests/test/index.html](../T9/build1/build/reports/tests/test/index.html)

------

### Run the build

```
gradle build
```
This will:  
- Compile the main code in `src/main/java`  
- Compile your test code in `src/test/java`  
- Run your tests same as `gradle test`  
- Generate reports in `/build/reports/tests/test/index.html`  
- Package your app into a JAR file which is the artifact you can share and run and place it in `/build/libs` (this is the packaged app ready to share or run on any machine with Java)  
- Create the compiled classes in `/build/classes` which are machine-readable files Gradle makes from your .java files. We rarely need to touch these.  

------

### Share or Deploy the App from the artifact

Share the JAR file with others—they just need Java installed to run it

```
java -jar build/libs/ivolve-app.jar
```