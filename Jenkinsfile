pipeline {
    agent any

    environment {
        IMAGE_NAME = 'nonweb-app'
        CONTAINER_NAME = 'nonweb-container'
    }

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/Bucky51/Improving-Collaboration-by-Integrating-Multiple-Tools.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t %IMAGE_NAME% .'
            }
        }

        stage('Run Docker Container') {
            steps {
                bat '''
                docker stop %CONTAINER_NAME% || echo "No running container"
                docker rm %CONTAINER_NAME% || echo "No container to remove"
                docker run --name %CONTAINER_NAME% %IMAGE_NAME%
                '''
            }
        }
    }

    post {
        success {
            echo '✅ Docker container executed successfully.'
        }
        failure {
            echo '❌ Something went wrong during execution.'
        }
    }
}
