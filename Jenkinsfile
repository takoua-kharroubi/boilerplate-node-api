#!/usr/bin/env groovy

node {
  stage("docker push") {
    def NODE_PORT = 31000 + "${ghprbPullId}".toInteger()
    
    git(url: "https://github.com/takoua-kharroubi/boilerplate-node-api.git", branch: "${ghprbSourceBranch}")
    sh "docker login -u takoua113 -p fasionhouse1993"
    sh "docker build -t takoua113/boilerplate-node-api:pr-${ghprbPullId} ."
    sh "docker push takoua113/boilerplate-node-api:pr-${ghprbPullId}"

   
  }
}
