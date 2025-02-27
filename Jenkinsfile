pipeline{
    agent any 
    environment{
        IMAGE_NAME="ravikharel/node-js"
        CONTAINER_NAME="new-container"
    } 
    stages{ 
        stage('building the image') { 
            steps{ 
                script{ 
                    sh "docker build -t ${IMAGE_NAME}:v1 ."
                    sh "docker images"
                }
            }
        }
        stage('building the container'){ 
            steps{ 
                script{ 
                    sh " docker container run -d -p 3000:3000 --name ${CONTAINER_NAME} ${IMAGE_NAME}:v1"
                    sh "docker container ps -a"
                }
            }
        }
        stage('pushing the image to the docker hub'){ 
            steps{ 
                script{ 
                    withDockerRegistry([credentialsId:'dockerhub-credentials']){
                        sh "docker push ${IMAGE_NAME}:v1"
                    }
                }
            }
        }

    }
    post{
        success{ 
            echo "Sucess!!"
        }
        failure{ 
            echo "failed!"
        }
    }
} 