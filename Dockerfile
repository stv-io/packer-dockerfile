FROM hashicorp/packer:1.8.6
LABEL org.opencontainers.image.description packer
RUN apk add --no-cache -q curl=7.88.1-r1 jq=1.6-r2 bash=5.2.15-r0 && \
    mkdir -p /root/.packer.d/plugins/ && \
    curl -sLO https://github.com/YaleUniversity/packer-provisioner-goss/releases/download/v3.1.4/packer-provisioner-goss-v3.1.4-linux-amd64.tar.gz && \
    tar -xvzf packer-provisioner-goss-v3.1.4-linux-amd64.tar.gz && \
    mv packer-provisioner-goss /bin/packer-provisioner-goss && \
    rm -vf README.md LICENSE packer-provisioner-goss-v3.1.4-linux-amd64.tar.gz
ENTRYPOINT [ "/bin/packer" ]