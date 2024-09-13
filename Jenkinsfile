pipeline{
    agent { label 'Jenkins-Agent'}
    tools{
        jdk 'Java17'
        maven 'Maven3'
    }
    stages{
        stage("Cleanup Workspace"){
            steps{
                cleanWs()
            }
        }
        stage("Check from SCM"){
            git branch: 'main', credentialsId: 'github', url: 'https://github.com/Code-Cafe-IT/register-app-ytb.git'
        }
        stage("Build Application"){
            steps{
                sh "mvn clean package"
            }
        }
        stage("Test Application"){
            steps{
                sh "mvn test"
            }
            
        }
    }
}