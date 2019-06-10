node('docker-j') {
  
 
  agent any
  
  stages {
    stage('Cloning Git') {
      steps {
        git ( url: 'https://github.com/pocteo/boilerplate-node-api.git', branch: '${sha1}' )
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
           docker.build pocteo/boilerplate-node-api + ":$ghprbPullId"
        }
      }
    }
    stage('Deploy Image') {
      steps{
         script {
           
            docker.build pocteo/boilerplate-node-api + ":$ghprbPullId".push()
         
        }
      }
    }
   
  
}
}
