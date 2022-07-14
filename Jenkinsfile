pipeline {
    agent any
        tools {
       maven 'maven-3.5.0'
    }
       stages {
           stage ('Test and Build') {
             steps{
             script{
                 sh 'mvn clean install'
                  }
              }
            }
            stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t doddabasappah/devops-app2 .'
                      }
                }
            }
            stage('Push image to Hub'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) 
                   {
                   sh 'docker login -u doddabasappah -p ${dockerhubpwd}' }
                   sh 'docker push doddabasappah/devops-integration'
                }
            }
            }
    }
    
}
