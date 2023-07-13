pipeline {
  agent any

  triggers {
    cron('0 8 * * 1')
  }

  stages {
    stage('Cypress Tests') {
      steps {
        checkout scm

        node {
          stage('Set up Node.js') {
            sh 'nvm install 14'
          }

          stage('Install dependencies') {
            sh 'npm ci'
          }

          stage('Run Cypress tests') {
            sh 'npx cypress run --browser chrome --env environmentName=homolog'
          }

          stage('Capture index.html') {
            sh 'cp cypress/reports/html/index.html $WORKSPACE/index.html'
          }

          stage('Publish artifact') {
            archiveArtifacts artifacts: 'index.html', onlyIfSuccessful: true
          }
        }
      }
    }
  }
}