pipeline {
    agent any

    stages{
        stage ('Permission to the script') {
            steps {
                 sh 'chmod +x build.sh'
                 sh 'chmod +x deploy.sh'
            }
           
        }
        stage ('build  the docker') {
            steps {
                script {
                    sh './build.sh'
                    sh './deploy.sh'
                }
            }
        }
    }
}