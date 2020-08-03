pipeline {
  agent any
  stages {
    stage('Stage 1') {
      steps {
        git branch: 'master',
          credentialsID: 'b74da730-f1c1-4f20-af0c-12c48062eebb',
          url: 'https://github.com/aco950/app.git'
      } 
    }
  }
}
