pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('kalinamomkova/******')
    }
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
                withCredentials([usernamePassword(credentialsId: 'kalinamomkova/******', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    bat 'docker build -t kalinamomkova/student-app:%BUILD_NUMBER% -t kalinamomkova/student-app:latest .'
                    bat "docker login -u ${DOCKER_USERNAME} --password ${DOCKER_PASSWORD}"
                    bat 'docker push --all-tags kalinamomkova/student-app'
                }
            }
        }
    }
}