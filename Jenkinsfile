pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh "docker build -t spring-pet ."
            }
        }
        stage('Test') {
            steps {
               jacoco( 
                      execPattern: 'target/*.exec',
                      classPattern: 'target/classes',
                      sourcePattern: 'src/main/java',
                      exclusionPattern: 'src/test*'
                      )
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

