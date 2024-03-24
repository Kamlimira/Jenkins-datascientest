pipeline {
    agent any
    environment { 
      DOCKER_ID = "dstdockerhub"
      DOCKER_IMAGE = "datascientestapi"
      DOCKER_TAG = "v.${BUILD_ID}.0" 
    }
    stages {
        stage('Building') {
          steps {
                sh 'pip install -r requirements.txt'
          }
        }
        stage('Testing') {
          steps {
                sh 'python3 -m unittest'
          }
        }
          stage('Deploying') {
          steps{
            script {
              sh '''
              docker rm -f jenkins
              docker build -t $DOCKER_ID/$DOCKER_IMAGE:$DOCKER_TAG .
              docker run -d -p 8000:8000 --name jenkins $DOCKER_ID/$DOCKER_IMAGE:$DOCKER_TAG
              '''
            }
          }
        }
          stage('User Acceptance') {
            steps{
                input(message: "Proceed to push to main?", ok: "Push to main")
            }
          }
        stage('Vérification des informations d\'identification') {
            steps {
                script {
                    def credentials = credentials('docker_jenkins')
                    echo "Nom d'utilisateur : ${credentials?.username}"
                    echo "Mot de passe : ${credentials?.password}"
                }
            }
            stage('Merging') {
              steps {
                echo 'Merging done'
              }
            }
          }
        }
    }
}
