node {
    def app

    stage('Environment verification'){
        sh 'docker --version'
        sh 'npm --version'
        sh 'docker image ls'
        sh 'echo ${BUILD_NUMBER}'
        sh 'npm cache clean --force'
        sh 'npm clean-install'
        sh 'npm config set registry http://registry.npmjs.org/'
    }

    stage('Clone repository') { 
        checkout scm
    }
    stage ('Install') {
        sh 'npm install'
    }

    stage ('Build') {
        sh 'npm run build'
    }


    stage('Build image') {
        echo "Starting Publish To Docker"
        sh 'docker build -f Dockerfile -t sujithkumar597/calc:${BUILD_NUMBER} .' 
            docker.withRegistry("http://registry.hub.docker.com/", "dockerhub_id") {
                // Push your image now
                sh 'docker image push sujithkumar597/calc:${BUILD_NUMBER}'
            }
        
    }

    post { 
        always { 
            cleanWs()
        }
    }
}
