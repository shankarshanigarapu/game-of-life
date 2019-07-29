#!groovy

pipeline {
    agent any
   
    parameters {
        choice(name: 'env', choices: 'DEV_PRACTICE/TEST_PRACTICE', description: 'Select Environment')
        choice(name: 'action', choices: 'plan\napply\nplan-destroy\ndestroy', description: 'Select Action')
    }
    stages {
	 stage('git') {
            steps {
                  git 'https://github.com/mani5a3/game-of-life.git'
                 }
                 }
     stage('build'){
            steps  {
                     bat 'mvn package'
                   }
        stage('Run Terraform') {
            environment {
                LAYER = "${params.env}"
                INFRA_ACTION = "${params.action}"
            }
      
        }
    }//stages
 
}//pipeline
