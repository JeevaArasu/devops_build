pipeline {
    agent any
    stages {
        stage ('Changing the file permission') {
            steps {
                sh 'chmod +x build.sh'
                sh 'chmod +x deploy.sh'
            }
        }

        stage('Build and Push Image') {
            steps {
                script {
                    sh './build.sh'
                    sh './deploy.sh'
                }
            }
        }
    }

}