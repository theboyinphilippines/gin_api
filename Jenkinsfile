pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'docker build -f Dockerfile -t gin_api .'
            }
        }
        stage('Test') {
            steps {
                sh 'docker images'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker run --rm  -p 8081:8080 --name gincontainer -d gin_api'
            }
        }
    }
}
