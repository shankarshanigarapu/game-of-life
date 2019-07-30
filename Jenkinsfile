
pipeline {
    agent any
	 
    parameters {
        choice(name: 'env', choices: 'DEV_PRACTICE\nTEST_PRACTICE', description: 'Select Environment')
        choice(name: 'action', choices: 'init\nplan\napply\nplan-destroy\ndestroy', description: 'Select Action')
    }  
	
    stages {
	 
	    
stage('Deploy') {
	

    steps{

sh "ssh-agent /bin/sh"	 
sh "ssh-add ~/.ssh/ansible_dynamic.pem"
  

} 
}//stage deploy    
	    

}//stages   
 
}//pipeline   
	     
	     
	     
	     
	     
	     
				   
				
