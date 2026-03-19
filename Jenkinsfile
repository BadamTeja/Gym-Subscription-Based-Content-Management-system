pipeline {
    agent any

    environment {
        GIT_REPO = 'https://github.com/BadamTeja/Gym-Subscription-Based-Content-Management-system.git'
        GIT_BRANCH = 'main'
        GIT_CREDS = 'git-creds'

        DOCKER_IMAGE = 'badamteja/gym-app'
        DOCKER_TAG = "${BUILD_NUMBER}"
        DOCKER_CREDS = 'docker-creds'

        CONTAINER_NAME = 'gym-app'
        NETWORK = 'gym-net'
    }

    stages {

        stage('Checkout Code') {
            steps {
                checkout scmGit(
                    branches: [[name: "*/${GIT_BRANCH}"]],
                    userRemoteConfigs: [[
                        credentialsId: "${GIT_CREDS}",
                        url: "${GIT_REPO}"
                    ]]
                )
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                docker build -t $DOCKER_IMAGE:$DOCKER_TAG .
                docker tag $DOCKER_IMAGE:$DOCKER_TAG $DOCKER_IMAGE:latest
                '''
            }
        }

        stage('Login & Push Image') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: "${DOCKER_CREDS}",
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS'
                )]) {
                    sh '''
                    echo $PASS | docker login -u $USER --password-stdin
                    docker push $DOCKER_IMAGE:$DOCKER_TAG
                    docker push $DOCKER_IMAGE:latest
                    '''
                }
            }
        }

        stage('Deploy Container') {
            steps {
                sh '''
                echo "Stopping old container..."
                docker rm -f $CONTAINER_NAME || true

                echo "Pull latest image..."
                docker pull $DOCKER_IMAGE:latest

                echo "Running new container..."
                docker run -d \
                --name $CONTAINER_NAME \
                --network $NETWORK \
                -p 5001:5000 \
                $DOCKER_IMAGE:latest
                '''
            }
        }

        stage('Cleanup Old Images') {
            steps {
                sh '''
                echo "Cleaning unused Docker images..."
                docker image prune -f
                '''
            }
        }
    }

    post {
        success {
            echo "✅ Application deployed successfully!"
        }
        failure {
            echo "❌ Pipeline failed!"
        }
        always {
            sh 'docker logout || true'
        }
    }
}
