pipeline {
    agent any

    environment {
        OPENBMC_IMAGE = 'openbmc/openbmc-qemu:latest' // Docker image with OpenBMC and QEMU
    }

    stages {
        stage('Start QEMU with OpenBMC') {
            steps {
                echo 'Запуск QEMU с OpenBMC'
                script {
                    // Запуск qemu в фоне (пример)
                    sh '''
                    docker run -d --name openbmc_qemu ${OPENBMC_IMAGE}
                    '''
                }
            }
        }

        stage('Run OpenBMC Autotests') {
            steps {
                echo 'Запуск автотестов OpenBMC'
                script {
                    // Запуск автотестов, сюда добавьте команду запуска автотестов OpenBMC
                    sh '''
                    docker exec openbmc_qemu /usr/local/bin/run_autotests.sh
                    '''
                }
            }
        }

        stage('Run OpenBMC WebUI Tests') {
            steps {
                echo 'Запуск WebUI тестов OpenBMC'
                script {
                    // Запуск WebUI тестов (пример)
                    sh '''
                    docker exec openbmc_qemu /usr/local/bin/run_webui_tests.sh
                    '''
                }
            }
        }

        stage('Run OpenBMC Load Tests') {
            steps {
                echo 'Запуск нагрузочного тестирования OpenBMC'
                script {
                    // Запуск нагрузочного тестирования
                    sh '''
                    docker exec openbmc_qemu /usr/local/bin/run_load_tests.sh
                    '''
                }
            }
        }
    }

    post {
        always {
            echo 'Остановка QEMU с OpenBMC'
            sh 'docker stop openbmc_qemu && docker rm openbmc_qemu'
        }
    }
}

