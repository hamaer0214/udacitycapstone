shell node {
        stage('Clone') {
            echo "1.Clone Stage"
            git url: "https://github.com/hamaer0214/udacitycapstone.git"
            script {
                build_tag = sh(returnStdout: true, script: 'git rev-parse --short HEAD').trim()
                }
        }  
        stage('Lint HTML') {
            sh 'tidy -q -e *.html'
         } 
        stage('Build') {
            echo "3.Build Docker Image Stage"
            sh "sudo bash run_docker.sh"
        }
        stage('Push') {
            echo "4.Push Docker Image Stage"
            withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]){
                
                sh "sudo bash upload_docker.sh"
        }
        stage('startMinikube') {
            echo "4.Deploy by kubectl"
            
        } 
        stage('Deploy') {
            
            sh "kubectl get pods"
            sh "kubectl port-forward deployments/nginx-hello 8000:80"
        }
        stage('Update') {
            echo "5.rolling update"
            sh "sudo bash rollingUpdate.sh"
        }                  
    }
}
