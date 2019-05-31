node('docker-j') {
  environment {
    registry = "pocteo/boilerplate-node-api"
    dockerImage = ''
  }
 
  stage('docker push') {
    sh 'docker version'
    git(url: 'https://github.com/pocteo/boilerplate-node-api.git', branch: '13_test-pr')
    sh 'docker login -u pocteo -p @hi_pocteo'
    sh 'dockerImage = docker.build   registry  + ":$BUILD_NUMBER"'
    /*sh 'docker push pocteo/boilerplate-node-api:pr-13'*/
    sh 'dockerImage.push()'
 
  }
}
