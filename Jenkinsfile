#!groovy

node {

  currentBuild.result = "SUCCESS"

  try {
    stage('Checkout') {
      checkout scm
    }

    stage('Test') {
      sh 'tox -e test'
    }

    stage('Archive') {
      archiveArtifacts artifacts: 'README.md,defaults/*.yml,files/*,handlers/*.yml,meta/main.yml,tasks/*.yml,templates/*.yml'
    }

    stage('Publish') {
      sh 'scripts/push.sh'
    }

    stage('Clean up') {
      step([$class: 'WsCleanup'])
    }
  }

  catch(err) {
    sh 'tox -e destroy'
    currentBuild.result = "FAILURE"
    throw err
  }
}
