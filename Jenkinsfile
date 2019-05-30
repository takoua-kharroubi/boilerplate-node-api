environment {
    registry = "pocteo/boilerplate-node-api"
    registryCredential = 'dockerhub-credentials'
    dockerImage = ''
  }
  agent any
  tools {nodejs "node" }
  stages {
    stage('Cloning Git') {
      steps {
        git (url: 'https://github.com/pocteo/boilerplate-node-api.git', branch: '13_test-pr')
          
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
         script {
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
     }
  }
