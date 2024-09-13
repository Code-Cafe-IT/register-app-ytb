pipeline{
    agent { label 'Jenkins-Agent'}
    tools{
        jdk 'Java17'
        maven 'Maven3'
    }
    environment{
        APP_NAME = "register-app-ci"
        RELEASE = "1.0.0"
        DOCKER_USER = "minhduccloud"
        DOCKER_PASS = 'dockerhub'
        IMAGE_NAME = "${DOCKER_USER}" + "/" + "${APP_NAME}"
        IMAGE_TAG = "${RELEASE}-${BUILD_NUMBER}"
	    // JENKINS_API_TOKEN = credentials("JENKINS_API_TOKEN")
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
                    //Phân tích mã nguồn của dự án bằng SonarQube.
                    withSonarQubeEnv(credentialsId: 'jenkins-sonarqube-token') {
                        sh "mvn sonar:sonar"
                    }
                }
            }
        }
        stage("Quality Gate"){
            steps{
                script{
                    //Kiểm tra xem mã nguồn có đạt tiêu chuẩn chất lượng theo các quy tắc của SonarQube Quality Gate hay không.
                    waitForQualityGate abortPipeline: false, credentialsId: 'jenkins-sonarqube-token'
                }
            }
        }
        stage("Build & Push Docker Image"){
            steps{
                script{
                    docker.withRegistry('', DOCKER_PASS){
                        docker_image = docker.build "${IMAGE_NAME}"
                    }
                    docker.withRegistry('', DOCKER_PASS){
                        docker_image.push("${IMAGE_TAG}")
                        docker_image.push("latest")
                    }
                }
            }
        }
    }
}