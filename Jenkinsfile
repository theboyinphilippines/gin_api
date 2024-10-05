pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'docker build -f Dockerfile -t gin_api:\${branch} .'
            }
        }
        stage('Test') {
            steps {
                    sh '''
                    if [[0 -eq `docker ps | grep gincontainer`]
                    then
                        echo "容器未启动"
                    else
                        docker stop gincontainer
                    fi
                    '''
            }
        }
        stage('Deploy') {
            steps {
                echo '重新启动容器'
                sh 'docker run --rm -p 8081:8080 --name gincontainer -d gin_api:\${branch}'
                echo '清理旧镜像(状态为none的镜像)'
                sh 'docker image prune -f'
            }
        }
    }
}
