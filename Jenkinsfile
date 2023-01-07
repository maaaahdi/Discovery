pipeline {
	agent any


    stages {

        stage('Build du projet') {
		 agent { docker 'maven:3-alpine' }
            steps {

                sh 'mvn clean install -DskipTests '
				stash includes: 'target/*.jar', name: 'targetfiles'

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