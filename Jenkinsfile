pipeline {
    agent any

    stages {
        stage('Checkout SCM') {
            steps {
                git branch: 'main', url: 'https://github.com/Bucky51/Improving-Collaboration-by-Integrating-Multiple-Tools.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t my-app-image .'
            }
        }

        stage('Run Docker Container') {
            steps {
                bat '''
                docker rm -f flask-app || echo "No container to remove"
                docker run -d --name flask-app -p 5000:5000 my-app-image
                '''
            }
        }
    }

    post {
        failure {
            echo 'Build failed!'
        }
        success {
            echo 'Build succeeded!'
        }
    }
}
