
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
                    sh 'chmod +x infra.sh'
                    if (params.env == 'DEV_PRACTICE')
                        sh 'AWS_ACCOUNT_ID=407449588770 ./infra.sh'
                }
            }
		
        }

}//stages   
 
}//pipeline   
	     
	     
	     
	     
	     
	     
				   
				
