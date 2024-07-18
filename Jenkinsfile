pipeline{
    agent { label 'Jenkins-Agent'}
    tools {
        jdk 'Java17'
        maven 'Maven3'
    }
    stages{
        stage("Cleanup Workpace"){
            steps{
                cleanWs()
            }
        }
        stage("Check from SCM"){
            steps{
                git branch: 'main', credentialsId: 'github', url: 'https://github.com/Code-Cafe-IT/register-app-ytb.git'
            }
        }
        stage("Build Application"){
            steps{
                sh "mvn clean package"
            }
        }
        stage("Test Application"){
            steps{
                sh 'mvn test'
            }
        }
        stage("SonarQube Analysis"){
            steps{
                script{
                    withSonarQubeEnv(credentialsId: 'sonarqube-token') {
                        sh 'mvn sonar:sonar'
                    }
                }
            }
        }
        stage("Sonarqube Gate"){
            steps{
                script{
                    waitForQualityGate abortPipeline: false, credentialsId: 'sonarqube-token'
                }
            }
        }
    }
}