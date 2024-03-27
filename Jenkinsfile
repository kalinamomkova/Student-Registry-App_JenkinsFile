pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('2f7bc99f-3a08-4092-ba67-b104b60438ff')
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
                script {
                    input('Deploy to production')
                }
                withCredentials([usernamePassword(credentialsId: '2f7bc99f-3a08-4092-ba67-b104b60438ff', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    bat 'docker build -t kalinamomkova/student-app:%BUILD_NUMBER% -t kalinamomkova/student-app:latest .'
                    bat "docker login -u ${DOCKER_USERNAME} --password ${DOCKER_PASSWORD}"
                    bat 'docker push --all-tags kalinamomkova/student-app'
                }
            }
        }
    }
}