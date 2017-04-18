#!groovy

node {
  currentBuild.result = "SUCCESS"

  // https://www.quernus.co.uk/2016/10/03/wipe-workspace-jenkins-2.0-deletedir/
  deleteDir() // wipe the workspace

  try {
    stage('Checkout') {
      checkout scm
    }

//    stage('Test 2.1') {
//      configFileProvider([configFile(fileId: env.OPENRCFILEID, variable: 'OPENRCFILE')]) {
//        withEnv(["ANSIBLEVERSION=21"]) {
//          sh 'scripts/test.sh'
//        }
//      }
//    }

    stage('Test 2.2') {
      configFileProvider([configFile(fileId: env.OPENRCFILEID, variable: 'OPENRCFILE')]) {
        withEnv(["ANSIBLEVERSION=22"]) {
          sh 'scripts/test.sh'
        }
      }
    }

    stage('Test 2.3') {
      configFileProvider([configFile(fileId: env.OPENRCFILEID, variable: 'OPENRCFILE')]) {
        withEnv(["ANSIBLEVERSION=23"]) {
          sh 'scripts/test.sh'
        }
      }
    }

    stage('Push') {
      configFileProvider([configFile(fileId: env.NEXUSFILEID, variable: 'NEXUSFILE')]) {
        sh 'scripts/push.sh'
      }
    }
  }

  catch (err) {
    configFileProvider([configFile(fileId: env.OPENRCFILEID, variable: 'OPENRCFILE')]) {
      sh 'scripts/destroy.sh'
    }
    currentBuild.result = "FAILURE"
      throw err
  }
}
