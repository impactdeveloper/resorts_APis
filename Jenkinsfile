// pipeline {
//     agent {
//         docker {
//             image 'node:lts-bullseye-slim' 
//             args '-p 3000:3000' 
//         }
//     }

//     environment {
//         CI = 'true'
//     }
//     stages {
//         stage('Build') {
//             steps {
//                 // agent { docker { image 'node:14-alpine' args '-p 3000:3000' } }
//                 sh 'npm install'
//                 sh 'npm start'
//             }
//         }
//         stage('Test') {
//             steps{
//                 echo "this is test phase"
//             }
//         }
//         // stage('Deliver') {
//         //     steps {
//         //         sh './jenkins/scripts/deliver.sh'
//         //         input message: 'Finished using the web site? (Click "Proceed" to continue)'
//         //         sh './jenkins/scripts/kill.sh'
//         //     }
//         // }

//     }
// }

// node {
//     checkout scm

//     docker.withRegistry('https://registry.hub.docker.com', 'dockerHub') {
        
//         def customImage = docker.build('adnanbashir3358/resort-apis:1.0')

//         customImage.push()
//     }
// }

pipeline {
    agent { dockerfile true }
    stages {
        stage('Test') {
            steps {
                sh 'node --version'
                sh 'svn --version'
            }
        }
    }
}

// docker run --name jenkins-docker --rm --detach ^
//   --privileged --network jenkins --network-alias docker ^
//   --env DOCKER_TLS_CERTDIR=/certs ^
//   --volume jenkins-docker-certs:/certs/client ^
//   --volume jenkins-data:/var/jenkins_home ^
//   --publish 2375:2375 ^
//   docker:dind