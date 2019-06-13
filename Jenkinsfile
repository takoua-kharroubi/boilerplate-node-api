node('ci-docker-slave') {
  stage('docker push') {
    sh 'docker version'
    git(url: 'https://github.com/pocteo/boilerplate-node-api.git', branch: '${ghprbSourceBranch}')
    sh 'docker login -u pocteo -p @_1dockerhub'
    sh 'docker build -t pocteo/boilerplate-node-api:pr-${ghprbPullId} .'
    sh 'docker push pocteo/boilerplate-node-api:pr-${ghprbPullId}'
    
    def PULL_REQUEST_ID  = '${ghprbPullId}' as int
    def INGRESS = 31000 + PULL_REQUEST_ID as int
      
    sh 'echo ${INGRESS}'
    
    sh 'export PULL_REQUEST_ID=${ghprbPullId}'
    sh 'ansible-playbook /home/pocteo/takoua/deployment-of-nodejs-app/playbookapp.yaml --extra-vars="PULL_REQUEST_ID=${PULL_REQUEST_ID} INGRESS=${INGRESS}"'
  }
}
