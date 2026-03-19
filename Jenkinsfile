pipeline {
    agent any

    environment {
        GIT_REPO = 'https://github.com/BadamTeja/Gym-Subscription-Based-Content-Management-system.git'
        GIT_BRANCH = 'main'
        GIT_CREDS = 'git-creds'

        DOCKER_IMAGE = 'badamteja/gym-app'
        DOCKER_TAG = "${BUILD_NUMBER}"
        DOCKER_CREDS = 'docker-creds'
    }

    stages {

        stage('Checkout Code') {
            steps {
                checkout scmGit(
                    branches: [[name: "*/${GIT_BRANCH}"]],
                    extensions: [],
                    userRemoteConfigs: [[
                        credentialsId: "${GIT_CREDS}",
                        url: "${GIT_REPO}"
                    ]]
                )
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh """
                    docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} .
                    docker tag ${DOCKER_IMAGE}:${DOCKER_TAG} ${DOCKER_IMAGE}:latest
                    """
                }
            }
        }

        stage('Login to Docker Registry') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: "${DOCKER_CREDS}",
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh """
                    echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                    """
                }
            }
        }

        stage('Push Image to Registry') {
            steps {
                sh """
                docker push ${DOCKER_IMAGE}:${DOCKER_TAG}
                docker push ${DOCKER_IMAGE}:latest
                """
            }
        }
    }

    post {
        success {
            echo "Docker Image Built & Pushed Successfully!"
        }
        failure {
            echo "Pipeline Failed!"
        }
        always {
            sh 'docker logout || true'
        }
    }
}
