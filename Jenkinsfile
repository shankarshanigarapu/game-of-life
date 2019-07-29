
pipeline {
    agent any
   
    parameters {
        choice(name: 'env', choices: 'DEV_PRACTICE\nTEST_PRACTICE', description: 'Select Environment')
        choice(name: 'action', choices: 'init\nplan\napply\nplan-destroy\ndestroy', description: 'Select Action')
    }  
	
    stages {
	 stage('git') {
            steps {
                  git 'https://github.com/mani5a3/game-of-life.git'
                 }
                 }
     stage('build'){
            steps  {
                     sh 'mvn package'
                   }
     }
	      stage('terraform') {
            environment {
                LAYER = "${params.env}"
                INFRA_ACTION = "${params.action}"
            }
      
		 steps {

                script {
                    if (params.env == 'DEV_PRACTICE')
                        sh "make $INFRA_ACTION"
                }
            }
		
        }
	    
 
	    
	    
	     
 }//stages 
     }//pipeline     
	     
	     
	     
	     
	     
	     
				   
				
