shell node {
        stage('Clone') {
            echo "1.Clone Stage"
            git url: "https://github.com/hamaer0214/udacitycapstone.git"
            script {
                build_tag = sh(returnStdout: true, script: 'git rev-parse --short HEAD').trim()
                }
        }  
        stage('Lint HTML') {
            echo "2.Lint Test"
            sh 'tidy -q -e *.html'
         } 
        stage('Build') {
            echo "3.Build Docker Image Stage"
            sh "sudo bash run_docker.sh"
        }
        stage('Push') {
            echo "4.Push Docker Image Stage"
            withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]){
                sh "docker login -u ${dockerHubUser} -p ${dockerHubPassword}"
                sh "sudo bash upload_docker.sh"
        }
        stage('startMinikube') {
            echo "5.start minikube"
            sh "minikube start"
        } 
        stage('Kubectl Run') {
            echo "6.start minikube"
            sh "kubectl run --image=alchemistbear/nginx-hello nginx-hello --port=1234"
            sh "kubectl get pods"    
        }
        stage('Rolling Update') {
            echo "7.rolling update"
            sh "sudo bash rollingUpdate.sh"
        }
        stage('Deploy') {

            sh "kubectl port-forward deployments/nginx-hello 8000:80"
            
        }         
    }
}
