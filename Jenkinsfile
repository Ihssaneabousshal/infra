pipeline {
    agent any

    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
    }

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION    = 'us-east-1'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: 'PAT_Jenkins', url: 'https://github.com/Ihssaneabousshal/infra.git'
            }
        }
        stage('Terraform init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Plan') {
            steps {
                sh 'terraform plan -out tfplan'
            }
        }
        stage('Terraform apply') {
            steps {
                script {
                    if (params.autoApprove) {
                        sh 'terraform apply --auto-approve'
                    }
                }
            }
        } 

        stage("Ansible") {
            steps {
                ansiblePlaybook credentialsId: 'ec2', inventory: 'dynamic_inventory.ini', playbook: 'configapp.yml'
            }
        }
    }
}
