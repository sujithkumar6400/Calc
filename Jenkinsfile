node {
    def app

    stage('Environment verification'){
        sh 'docker --version'
        sh 'npm --version'
        sh 'echo ${BUILD_NUMBER}'
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
        sh 'docker image push sujithkumar597/calc:${BUILD_NUMBER}'
    }

    post { 
        always { 
            cleanWs()
        }
    }
}