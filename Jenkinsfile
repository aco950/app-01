pipeline {
  agent any
  environment {
    GIT 
  }
  stages {
    stage('Stage 1') {
      steps {
        git url: 'ssh://git@github.com:aco950/app.git'
      } 
    }
  }
}
