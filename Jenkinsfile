pipeline {
  agent {
    node {
      label 'windows_node'
    }

  }
  stages {
    stage('Clone RPA Code') {
      steps {
        echo 'Get RPA Code'
        git(credentialsId: '76076384-14e7-4082-aec5-96b40a3a77a5', url: 'https://gitlab-progetti-rs-2019.eastus.cloudapp.azure.com/rpa/orders-rpa-openfiber.git', branch: 'dev')
      }
    }

    stage('Execute RPA') {
      steps {
        powershell(script: '$PSVersionTable.PSVersion', returnStdout: true)
        powershell 'C:\\Users\\Administrator\\Documents\\WKI\\agent\\_work\\_tool\\Python\\3.11.1\\x64\\python.exe --version'
      }
    }

  }
}