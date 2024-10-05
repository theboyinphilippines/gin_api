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
                       try{
                                echo "第一次启动容器"
                                sh 'docker run --rm -p 8081:8080 --name gincontainer -d gin_api:\${branch}'
                            }catch(Throwable e){
                                echo "容器gincontainer已经启动,现在终止容器运行"
                                sh "docker stop gincontainer"
                                echo "移除容器gincontainer"
                                sh "docker rm gincontainer"
                            }
            }
        }
        stage('Deploy') {
            steps {
                echo '重新启动gincontainer容器'
                sh 'docker run --rm -p 8081:8080 --name gincontainer -d gin_api:\${branch}'
                echo '清理旧镜像(状态为none的镜像)'
                sh 'docker image prune -f'
            }
        }
    }
}
