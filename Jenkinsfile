pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh "mvn package"
            }
        }
        stage('Test') {
            steps {
                step( [ $class: 'JacocoPublisher' ] )
            }
        }
        stage('Deploy') {
            steps {
                sh "sudo mv target/spring*.jar /home/vagrant/prod/spring-pet.jar"
                sh "sudo systemctl restart spring-pet"
            }
        }
    }
}

