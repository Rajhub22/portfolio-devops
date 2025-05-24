pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build Docker image on Windows
                bat 'docker build -t portfolio-app .'
            }
        }

        stage('Deploy Container') {
            steps {
                // Stop and remove container if already running (optional)
                bat '''
                docker stop portfolio-app || echo Container not running
                docker rm portfolio-app || echo Container not found
                '''
                // Run Docker container
                bat 'docker run -d -p 8080:80 --name portfolio-app portfolio-app'
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished!'
        }
    }
}
