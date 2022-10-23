pipeline{
    agent any
    environment {
        DOCKER_USER     = credentials('dockeruser')
        DOCKER_PASSWORD = credentials('dockerPwd')
    }
    stages {
        stage('Pull Source Code from GitHub') {
            steps {
                git branch: 'main',
                credentialsId: 'git', 
                url: 'https://github.com/CloudHight/Pet-Adoption-Containerisation-Project-Application-Day-Team.git'
            }
        }
        stage('Code Analysis') {
            steps {
                withSonarQubeEnv('sonarQube') {
                   sh "mvn sonar:sonar"
                }
            }   
        }
        stage('BuildCode'){
            steps{

               sh 'mvn install -DskipTests=true'
            }
        }
        stage('DockerBuild'){
            steps{
                sh 'bash && docker build -t cloudhight/pipeline:1.0.0 .'
            }
        }
        stage('DockerLogin') {
            steps{
                sh 'docker login --username $DOCKER_USER --password $DOCKER_PASSWORD'
            }
        }
        stage('DockerPush') {
            steps{
                sh 'docker push cloudhight/pipeline:1.0.0'
            }
        }
        stage('Deploy') {
             steps {
               sshagent (['ansible_cred']) {
                   sh 'ssh -t -t ec2-user@10.0.3.246 -o strictHostKeyChecking=no "cd /etc/ansible && ansible-playbook MyPlaybook.yaml"'
                }
            }
        }
    }
}
