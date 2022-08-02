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
        stage('Build docker'){

            //build maven
            // sh 'mvn clean install'
            //sh 'mvn compile'
            sh "sudo dockerd"
            dockerImage = docker.build("commerce:${env.BUILD_NUMBER}")
        }
        stage('Deploy docker'){

            echo "Docker Image Tag Name : ${dockerImageTag}"

            sh "docker stop commerce || true && docker rm commerce || true"

            sh "docker run --name commerce -d -p 8888:8080 commerce:${env.BUILD_NUMBER}"
        }
    }catch(e){
        throw e
    }
}