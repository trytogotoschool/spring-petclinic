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
                sh "docker run -d -p 8081:8081 spring-pet"
                 
            }
        }
    }
}

