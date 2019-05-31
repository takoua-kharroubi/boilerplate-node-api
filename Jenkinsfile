node('docker-j') {
  environment {
    registry = "pocteo/boilerplate-node-api"
    dockerImage = ''
  }
 
  agent any
  tools {nodejs "node" }
  stages {
    stage('Cloning Git') {
      steps {
        git ( url: 'https://github.com/pocteo/boilerplate-node-api.git', branch: '13_test-pr' )
      }
    }
    stage('connecting') {
       steps {
         sh 'docker login -u pocteo -p @hi_pocteo'
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
           
            dockerImage.push()
         
        }
      }
    }
   
  
}
}
