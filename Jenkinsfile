
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
		
        } // stage terraform
	    
stage('Deploy') {
	
	when {
    expression { 
        params.action == 'apply'
        
    }
}
    steps{
sh "chmod 777 ec2.py"
sh "chmod 777 ec2.ini"
sh "ssh-agent bash"	  
sh "ssh-add ~/.ssh/ansible_dynamic.pem"	    
sh "./ec2.py --list --profile default --refresh-cache"
sh "ansible -i ec2.py -u ubuntu tag_Env_DEV_EC2 -m ping "
sh "ansible-playbook -i ec2.py -u ubuntu   tomcat.yml"
} 
}//stage deploy    
	    

}//stages   
 
}//pipeline   
	     
	     
	     
	     
	     
	     
				   
				
