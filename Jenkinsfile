pipeline {
  agent {
    node {
      label 'docker_factotum'
    }

  }
  stages {
    stage('Clone RPA Code') {
      steps {
        echo 'Get RPA Code'
        git(credentialsId: '${rpa_credential_id}', url: '${rpa_git_url}', branch: 'dev')
      }
    }

  }
  environment {
    rpa_credential_id = '76076384-14e7-4082-aec5-96b40a3a77a5'
    rpa_git_url = 'https://gitlab-progetti-rs-2019.eastus.cloudapp.azure.com/rpa/orders-rpa-openfiber.git'
    rpa_folder = '${WORKSPACE}/orders-rpa-openfiber'
  }
}