node('ci-docker-slave') {
  stage('docker push') {
    sh 'docker version'
    git(url: 'https://github.com/pocteo/boilerplate-node-api.git', branch: '12_test-pr')
    sh 'docker login -u pocteo -p @hi_pocteo'
    sh 'docker build -t pocteo/boilerplate-node-api:pr-12.'
    sh 'docker push pocteo/boilerplate-node-api:pr-12'
  }
}
