def COLOR_MAP = [
    'SUCCESS': 'good',
    'FAILURE': 'danger',
    ]

pipeline {
    agent any
    
    tools {
        terraform 'Terraform'
    }
    
    environment {
        AWS_ACCESS_KEY_ID     = credentials('jenkins-aws-secret-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key')
    }

    stages {
        stage('git checkout') {
            steps {
                echo 'Cloning codebase'
                git branch: 'main', url: 'https://github.com/lyndaholivia/airbnb-infra.git'
                sh 'ls'
            }
        }
        
        stage('terraform init') {
            steps {
                sh 'terraform init'
            }    
        }
        
        stage('terraform validate') {
            steps {
                sh 'terraform validate'
            }    
        }
        
        stage('terraform plan') {
            steps {
                sh 'terraform plan'
            }    
        }
        
        stage('terraform apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }    
        }
        
        stage('terraform destroy') {
            steps {
                sh 'terraform destroy -auto-approve'
            }    
        }
    }
    
    post { 
        always { 
            echo 'I will always say Hello again!' 
            slackSend channel: '#jjtech-empower-batch', color: COLOR_MAP[currentBuild.currentResult], message: "Done by lynda. *${currentBuild.currentResult}:* Job ${env.JOB_NAME} build ${env.BUILD_NUMBER} \n More info at: ${env.BUILD_URL}"
        }
    }   
    
}