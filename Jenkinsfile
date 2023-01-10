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
                         sh 'docker build . -t test1:latest'
						sh 'docker tag test1 mahdiguettiti/test1'
						sh 'docker push mahdiguettiti/test1'

                    }


               }
            }
	    stage('Deployement'){
            steps {
                withKubeCredentials(kubectlCredentials: [[caCertificate: '', clusterName: 'kubernetes', contextName: '',
							  credentialsId: 'Test.Kubernetes', namespace: 'default', serverUrl: 'https://172.31.92.163:6443']]) {
                        sh 'curl -LO "https://storage.googleapis.com/kubernetes-release/release/v1.20.5/bin/linux/amd64/kubectl"'
                        sh 'chmod u+x ./kubectl'
                        sh 'kubectl version'
                        echo 'service ok'
                    }
                }

                }

}
