shell node {
    stage('Clone') {
        echo "1.Clone Stage"
        git url: "https://github.com/hamaer0214/udacitycapstone.git"
        script {
            build_tag = sh(returnStdout: true, script: 'git rev-parse --short HEAD').trim()
        }
    }
    stage('Test') {
        echo "2.Test"
            agent {
                docker {
                    image 'qnib/pytest'
                }
            }
            steps {
                sh 'py.test --verbose --junit-xml test-reports/results.xml sources/test_calc.py'
            }
            post {
                always {
                    junit 'test-reports/results.xml'
                }
            }
        }
    stage('Build') {
        echo "3.Build Docker Image Stage"
        dockerpath=alchemistbear/nginx-hello
        sh "run_docker.sh"
    }
    stage('Push') {
        echo "4.Push Docker Image Stage"
        withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
            sh "docker login -u ${dockerHubUser} -p ${dockerHubPassword}"
            sh "upload_docker.sh"
        }
    }
}
