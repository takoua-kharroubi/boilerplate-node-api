#!/usr/bin/env groovy

node{
  stage("docker push") {
    def NODE_PORT = 31000 + "${ghprbPullId}".toInteger()
    
    git(url: "https://github.com/pocteo/boilerplate-node-api.git", branch: "${ghprbSourceBranch}")
    sh "docker login -u pocteo -p @_1dockerhub"
    sh "docker build -t pocteo/boilerplate-node-api:pr-${ghprbPullId} ."
    sh "npm install"
    sh "npm test"
    sh "docker push pocteo/boilerplate-node-api:pr-${ghprbPullId}"

    sh "ansible-playbook /home/takoua/stage/deployment-of-nodejs-app/playbookapp.yaml --extra-vars=\"PULL_REQUEST_ID=${ghprbPullId} NODE_PORT=${NODE_PORT}\""
  }
}
