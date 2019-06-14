#!/usr/bin/env groovy

node("ci-docker-slave") {
  stage("docker push") {
    def NODE_PORT = 31000 + "${ghprbPullId}".toInteger()
    
    git(url: "https://github.com/pocteo/boilerplate-node-api.git", branch: "${ghprbSourceBranch}")
    sh "docker login -u pocteo -p @_1dockerhub"
    sh "docker build -t pocteo/boilerplate-node-api:pr-${ghprbPullId} ."
    sh "docker push pocteo/boilerplate-node-api:pr-${ghprbPullId}"

    sh "ansible-playbook /home/pocteo/takoua/deployment-of-nodejs-app/playbookapp.yaml --extra-vars=\"PULL_REQUEST_ID=${ghprbPullId} NODE_PORT=${NODE_PORT}\""
  }
}
