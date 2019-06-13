#!/usr/bin/env groovy

import groovy.transform.Field

node("ci-docker-slave") {
  stage("docker push") {
    @Field def PULL_REQUEST_ID = "${ghprbPullId}" as String
    @Field def INGRESS = 31901 as Integer
      
    git(url: "https://github.com/pocteo/boilerplate-node-api.git", branch: "${ghprbSourceBranch}")
    sh "docker login -u pocteo -p @_1dockerhub"
    sh "docker build -t pocteo/boilerplate-node-api:pr-${ghprbPullId} ."
    sh "docker push pocteo/boilerplate-node-api:pr-${ghprbPullId}"
    
    sh "ansible-playbook /home/pocteo/takoua/deployment-of-nodejs-app/playbookapp.yaml --extra-vars=\"PULL_REQUEST_ID=${PULL_REQUEST_ID} INGRESS=${INGRESS}\""
  }
}
