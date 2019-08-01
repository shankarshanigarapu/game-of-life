pipeline {
    agent any
	 environment {
        AWS_ROLE = "Terraformrole"
    }
   
    parameters {
        choice(name: 'env', choices: 'DEV_PRACTICE\nTEST_PRACTICE', description: 'Select Environment')
        choice(name: 'action', choices: 'init\nplan\napply\nplan-destroy\ndestroy', description: 'Select Action')
    }  
	
    stages {
	 stage('git') {
            steps {
                  git 'https://github.com/mani5a3/game-of-life.git'
                 }
                 }// stage git
     stage('build'){
            steps  {
                     sh 'mvn package'
                   }
	     
     }//stage build
	    
	 stage('SonarQube analysis'){
       steps {

          withSonarQubeEnv('sonarqube') {
  
             sh "**/sonar-scanner-3.3.0.1492-linux/bin/sonar-scanner -Dproject.settings=sonar-project.properties"
               }
             }
          }  //stage SonarQube analysis 
	    
	
	    
	         

}//stages   
 
}//pipeline   
