pipeline {
  agent {
    node {
      label 'test1'
    }

  }
  stages {
    stage('rfff') {
      parallel {
        stage('rffffadfa') {
          steps {
            sh 'ls'
          }
        }
        stage('fff') {
          steps {
            sh 'echo "ha"'
            sh 'ls'
          }
        }
      }
    }
  }
}