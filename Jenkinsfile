pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Rajhub22/portfolio-devops.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build('portfolio-app')
                }
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    // Stop and remove any running container with the same name
                    sh 'docker stop portfolio-app-container || true'
                    sh 'docker rm portfolio-app-container || true'

                    // Run new container
                    sh 'docker run -d -p 8081:80 --name portfolio-app-container portfolio-app'
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished!'
        }
    }
}
