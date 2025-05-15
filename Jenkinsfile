pipeline {
    agent any

    environment {
        IMAGE_NAME = 'collab-app'
        CONTAINER_NAME = 'collab-container'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/Bucky51/Improving-Collaboration-by-Integrating-Multiple-Tools.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $IMAGE_NAME .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Stop existing container if running
                    sh '''
                        if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
                          docker stop $CONTAINER_NAME
                          docker rm $CONTAINER_NAME
                        fi
                        docker run -d -p 3000:3000 --name $CONTAINER_NAME $IMAGE_NAME
                    '''
                }
            }
        }
    }

    post {
        success {
            echo '✅ Application deployed successfully!'
        }
        failure {
            echo '❌ Build or deployment failed!'
        }
    }
}
