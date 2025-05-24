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
                bat 'docker build -t portfolio-app .'
            }
        }

        stage('Deploy Container') {
            steps {
                bat '''
                docker stop portfolio-app || exit 0
                docker rm portfolio-app || exit 0
                docker run -d -p 8081:80 --name portfolio-app portfolio-app
                '''
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished!'
        }
    }
}
