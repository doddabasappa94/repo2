pipeline {
    agent any
    stages{
        stage('checkout'){
         parallel {
          stage('main branch checkout') {
              steps{
              checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/doddabasappa94/parallel-devops.git']]])  
              }
              }
             stage('develop branch checkout') {
              steps{
              checkout([$class: 'GitSCM', branches: [[name: '*/develop']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/doddabasappa94/parallel-devops.git']]])  
              }
              }
         }
        }
         stage('Build'){
         parallel {
                    stage('Build docker app1 image'){
            steps{
                script{
                    sh 'docker build -t doddabasappah/devops-app1 .'
                }
            }
        }
             
               stage('Build docker app2 image'){
            steps{
                script{
                    sh 'docker build -t doddabasappah/devops-app2 .'
                }
            }
        }
         }
         }
        stage ('Push') {
            parallel{
            stage('Push app1 image to Hub'){
             steps{
                script{
                   withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                   sh 'docker login -u doddabasappah -p ${dockerhubpwd}'
                     }
                   sh 'docker push doddabasappah/devops-app1'
                }
             }
            }
            stage('Push app2 image to Hub'){
             steps{
                script{
                   withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                   sh 'docker login -u doddabasappah -p ${dockerhubpwd}'
                     }
                   sh 'docker push doddabasappah/devops-app2'
                }
             }
            }
         }
         }
        stage(' Deploy to k8s'){
              parallel {
                stage('Deploy app1 to k8s'){
            steps{
                script{
                    kubernetesDeploy (configs: 'deploymentservice1.yaml',kubeconfigId: 'k8sconfigpwd')
                }
            }
         }
         stage('Deploy app2 to k8s'){
            steps{
                script{
                    kubernetesDeploy (configs: 'deploymentservice2.yaml',kubeconfigId: 'k8sconfigpwd')
                    }
                }
             }
         }
        }
    
    }
}
