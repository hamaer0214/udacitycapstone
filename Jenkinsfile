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
            docker.withRegistry('https://hub.docker.com', 'dockerHub'){
                sh "sudo bash upload_docker.sh"
        }
    }
}
