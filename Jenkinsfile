node {
    def app

    stage('Clone repository') {
       
    git(url: 'https://github.com/pocteo/boilerplate-node-api.git', branch: '13_test-pr')
    }

    stage('Build image') {
        
        app = docker.build("getintodevops/hellonode")
    }

   

    stage('Push image') {
        
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}
