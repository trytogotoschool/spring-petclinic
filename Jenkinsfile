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
                sh "sudo mv target/spring*.jar /home/vagrant/data/spring-pet.jar"
                sh "sudo systemctl restart spring-pet"
            }
        }
    }
}

