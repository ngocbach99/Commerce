node{
    def WORKSPACE = "/var/jenkins_home/workspace/commerce"
    def dockerImageTag = "commerce${env.BUILD_NUMBER}"

    try{
        stage('Clone Repo'){

            //for display purposes
            //Get some code from Git repository
            git url: 'https://github.com/ngocbach99/Commerce.git',
            credentialsId: 'global',
            branch: 'main'
        }
        stage('Initialize'){
             def dockerHome = tool 'myDocker'
             env.PATH = "${dockerHome}/bin:${env.PATH}"
        }
        /* stage('Build docker'){

            //build maven
            // sh 'mvn clean install'
            //sh 'mvn compile'
            dockerImage = docker.build("commerce:${env.BUILD_NUMBER}")
        } */
        stage('Deploy docker'){

            echo "Docker Image Tag Name : ${dockerImageTag}"

            sh "/usr/local/bin/docker-compose up -d"

            sh "/usr/local/bin/docker-compose ps"

            //sh "docker stop commerce || true && docker rm commerce || true"

            //sh "docker run --name commerce -d -p 8081:8081 commerce:${env.BUILD_NUMBER}"
        }
    }catch(e){
        throw e
    }
}