pipeline {
    agent any

    stages {
        stage('NPM Install') {
            steps {
                bat 'npm install'
            }
        }
        stage('NPM Audit') {
            steps {
                bat 'npm audit'
            }
        }
        stage('Run integration tests') {
            steps {
                bat 'npm run test'
            }
        }
        stage('Deploy application') {
            steps {
                bat 'docker pull kalinamomkova/student-app'
                bat 'docker-compose -f docker-compose.yml up -d'
            }
        }
    }
}