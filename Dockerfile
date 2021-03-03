FROM maven
#coping src of your framework
COPY src /home/ParallelExecution/src
#coping pom file of your framework
COPY pom.xml /home/ParallelExecution
#copy chromedriver
COPY chromedriver.exe /home/ParallelExecution

#building the package
RUN mvn -f /home/ParallelExecution/pom.xml clean test -DskipTests=true
