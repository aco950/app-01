node {
  def app

  stage('Stage 1') {
    checkout scm
  }
  stage('Stage 2') {
    app = docker.build("app/1.1")
  }
}
