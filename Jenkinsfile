pipeline {
  agent any
  tools {
     jdk "Java-1.8"
     maven "Maven-3.6.3"
  }
  stages {
    stage('Clone sources') {
      steps {
         git url: 'https://github.com/pavan-macherla/App'
      }
    }
    stage('Execute Maven') {
      steps {
        script {
          rtMaven.run pom: 'pom.xml', goals: 'clean install', buildInfo: buildInfo
        }
      }
    }
    stage('Publish build info') {
       steps {
         script {
           server.publishBuildInfo buildInfo
         }
       }
    }
  }
