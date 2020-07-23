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
                sh "docker run -d -p 8081:8081  -e MYSQL_URL=jdbc:mysql://172.17.0.2/petclinic spring-pet "
                 
            }
        }
    }
}

