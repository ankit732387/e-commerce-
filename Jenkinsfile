pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('ankit-dockerhub') // Jenkins credential ID
        IMAGE_NAME = 'ankit732387/ecommerce'
        GIT_REPO = 'https://github.com/ankit732387/e-commerce-.git'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: "${https://github.com/ankit732387/e-commerce-.git}"
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${ankit732387/ecommerce}:latest", '.')
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', "${ankit-dockerhub}") {
                        docker.image("${ankit732387/ecommerce}:latest").push()
                    }
                }
            }
        }

        stage('Deploy Container') {
            steps {
                sh """
                    docker rm -f ecommerce-container || true
                    docker run -d -p 80:80 --name ecommerce-container ${ankit732387/ecommerce}:latest
                """
            }
        }
    }
}
