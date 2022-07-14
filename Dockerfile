FROM openjdk:8
EXPOSE 8080
ADD target/devops-app2.jar devops-app2.jar
ENTRYPOINT ["java","-jar","/devops-app2.jar"]
