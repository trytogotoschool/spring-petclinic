pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh "mvn package"
            }
        }
        stage('Deploy') {
            steps {
                sh "mv target/spring*.jar /home/vagrant/data/spring-pet.jar"
                sh "systemctl restart spring-pet"
            }
        }
    }
}

