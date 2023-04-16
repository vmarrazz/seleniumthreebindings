pipeline {
  agent {
    node {
      label 'windows_node'
    }

  }
  stages {
    stage('Prepare Workspace') {
      steps {
        echo 'Get RPA Code'
        git(credentialsId: '76076384-14e7-4082-aec5-96b40a3a77a5', url: 'https://gitlab-progetti-rs-2019.eastus.cloudapp.azure.com/rpa/orders-rpa-openfiber.git', branch: 'dev')
        powershell(script: 'C:\\Users\\Administrator\\Documents\\WKI\\agent\\_work\\_tool\\Python\\3.11.1\\x64\\Scripts\\pip.exe install --upgrade pip pipenv', returnStdout: true)
        dir(path: 'seleniumthreebindings_main') {
          powershell(script: 'C:\\Users\\Administrator\\Documents\\WKI\\agent\\_work\\_tool\\Python\\3.11.1\\x64\\Scripts\\pipenv.exe install', returnStdout: true)
        }

      }
    }

    stage('Execute RPA') {
      steps {
        powershell(script: 'C:\\Users\\Administrator\\Documents\\WKI\\agent\\_work\\_tool\\Python\\3.11.1\\x64\\Scripts\\pip.exe install --upgrade pip pipenv', returnStdout: true)
        dir(path: 'seleniumthreebindings_main') {
          powershell 'C:\\Users\\Administrator\\.virtualenvs\\seleniumthreebindings_main-pnpKrErx\\Scripts\\robot.exe --version'
        }

      }
    }

  }
}