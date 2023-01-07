pipeline {
	agent any


    stages {

        stage('Build du projet') {
		 agent { docker 'maven:3-alpine' }
            steps {

                echo 'eeeer'

            }
        }



	stage('Construction image') {
            steps {
                 unstash 'targetfiles'

			   script {
                        sh 'docker build . -t discoverymc:latest'
						sh 'docker tag discoverymc h4mdi/discoverymc'
						sh 'docker push h4mdi/discoverymc'
                    }


               }
            }
        }
}