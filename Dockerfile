FROM jenkins/jenkins:lts

USER root

RUN apt-get update && \
    apt-get install -y \
        qemu-system-arm \
        qemu-system-aarch64 \
        qemu-utils \
        curl \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Проверим, что qemu-system-arm действительно есть
RUN if [ ! -f /usr/bin/qemu-system-arm ]; then \
        echo "ERROR: qemu-system-arm not found!"; \
        ls /usr/bin/qemu-system-* || true; \
        exit 1; \
    fi

USER jenkins
