pipeline {
  agent any
  environment {
    registry = "reg-01.ogilvie.us/app"
    registryCredential = 'docker_registry'
  }
  stages {
    stage('Stage 1') {
      steps {
        git branch: 'master',
          credentialsId: 'b74da730-f1c1-4f20-af0c-12c48062eebb',
          url: 'https://github.com/aco950/app.git'
      } 
    }
    stage('Stage 2') {
      steps {
        script {
          dockerImage = docker.build registry 
        }
      }
    }
    stage('Stage 3') {
      steps {
        script {
          docker.withRegistry('https://reg-01.ogilvie.us', registryCredential) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Stage 4') {
      steps {
        sh 'terraform init'
      }
    }
  }
}

