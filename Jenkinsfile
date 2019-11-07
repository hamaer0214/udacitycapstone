shell node {
        stage('Clone') {
                echo "1.Clone Stage"
                git url: "https://github.com/hamaer0214/udacitycapstone.git"
                script {
                    build_tag = sh(returnStdout: true, script: 'git rev-parse --short HEAD').trim()
            }
        }  
        stage('Lint HTML') {
          steps {
              sh 'tidy -q -e *.html'
            }
         } 
        stage('Build') {
            echo "3.Build Docker Image Stage"
            sh "sed -i 's/<BUILD_TAG>/${build_tag}/' run_docker.sh"
        }
        stage('Push') {
            echo "4.Push Docker Image Stage"
            withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                sh "docker login -u ${dockerHubUser} -p ${dockerHubPassword}"
                sh "sed -i 's/<BUILD_TAG>/${build_tag}/' upload_docker.sh"
            }
        }
    }
