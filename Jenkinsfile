pipeline {
    agent any
    stages {
        stage ('Checkout') {
          steps {
            git 'https://github.com/trytogotoschool/spring-petclinic.git/'
          }
        }
        stage('Build') {
            steps {
                sh 'mvn package'
            }
        }
        stage('Deploy') {
            steps {
                sh 'mv target/spring*.jar /home/vagrant/data/spring-pet.jar'
            }
        }
    }
}

