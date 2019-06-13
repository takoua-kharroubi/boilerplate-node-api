#!/usr/bin/env groovy

def NODE_PORT = null

node("ci-docker-slave") {
  stage('Get nodePort number') {
    script {
      NODE_PORT = sh("expr 31000 + 35")
    }
  }

  stage("docker push") {

    git(url: "https://github.com/pocteo/boilerplate-node-api.git", branch: "${ghprbSourceBranch}")
    sh "docker login -u pocteo -p @_1dockerhub"
    sh "docker build -t pocteo/boilerplate-node-api:pr-${ghprbPullId} ."
    sh "docker push pocteo/boilerplate-node-api:pr-${ghprbPullId}"

    sh "ansible-playbook /home/pocteo/takoua/deployment-of-nodejs-app/playbookapp.yaml --extra-vars=\"PULL_REQUEST_ID=${ghprbPullId} NODE_PORT=${NODE_PORT}\""
  }
}
