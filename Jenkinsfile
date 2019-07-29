
pipeline {
    agent any
   
   
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
				   }
				   }
				   }
