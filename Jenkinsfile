pipeline{
    agent any 
    environment{
        IMAGE_NAME="harbor.registry.local/node-js-1/webapp:v1"
        CONTAINER_NAME="new-container"
        
    } 
    stages{ 
        stage('building the image') { 
            steps{ 
                script{ 
                    sh "docker build -t ${IMAGE_NAME} ."
                    sh "docker images"
                }
            }
        }
        stage('building the container'){ 
            steps{ 
                script{ 
                    sh " docker container run -d -p 3000:3000 --name ${CONTAINER_NAME} ${IMAGE_NAME}"
                    sh "docker container ps -a"
                }
            }
        }
        stage('pushing the image to the docker hub'){ 
            steps{ 
                script{ 
                    sh "docker push ${IMAGE_NAME}"
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