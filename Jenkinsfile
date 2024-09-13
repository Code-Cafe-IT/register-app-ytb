pipeline{
    agent { label 'Jenkins-Agent'}
    tools{
        jdk 'Java17'
        maven 'Maven3'
    }
    stages{
        stage("Cleanup Workspace"){
            steps{
                // dọn dẹp workspace trước khi bắt đầu. Nó xóa bỏ toàn bộ các file và thư mục từ các build trước đó. 
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
                // Maven sẽ xóa bỏ các file từ build cũ (clean) và tạo ra một gói (package) mới
                sh "mvn clean package"
            }
        }
        stage("Test Application"){
            steps{
                // Maven sẽ chạy các test cases được định nghĩa trong mã nguồn
                sh "mvn test"
            }
        }
        stage("Sonarqube Analysis"){
            steps{
                script{
                    withSonarQubeEnv(credentialsId: 'jenkins-sonarqube-token') {
                        sh "mvn sonar:sonar"
                    }
                }
            }
        }
        stage("Quality Gate"){
            steps{
                script{
                    waitForQualityGate abortPipeline: false, credentialsId: 'jenkins-sonarqube-token'
                }
            }
        }
    }
}