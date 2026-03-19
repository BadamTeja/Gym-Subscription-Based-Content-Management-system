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
                    userRemoteConfigs: [[
                        credentialsId: "${GIT_CREDS}",
                        url: "${GIT_REPO}"
                    ]]
                )
            }
        }

        stage('Install Dependencies (Validation)') {
            steps {
                sh '''
                python3 -m venv venv
                . venv/bin/activate
                pip install -r requirements.txt
                '''
            }
        }

        stage('Code Check') {
            steps {
                sh '''
                echo "Checking Python syntax..."
                python3 -m py_compile app.py
                '''
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

        stage('Docker Login & Push') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: "${DOCKER_CREDS}",
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh '''
                    echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                    docker push $DOCKER_IMAGE:$DOCKER_TAG
                    docker push $DOCKER_IMAGE:latest
                    '''
                }
            }
        }
    }

    post {
        success {
            echo "✅ Image pushed successfully!"
        }
        failure {
            echo "❌ Pipeline failed!"
        }
        always {
            sh 'docker logout || true'
        }
    }
}
