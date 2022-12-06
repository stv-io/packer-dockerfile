FROM hashicorp/packer:1.8.4
RUN apk add --no-cache -q curl=7.83.1-r4 jq=1.6-r1 bash=5.1.16-r2 && \
    mkdir -p /root/.packer.d/plugins/ && \
    curl -sLO https://github.com/YaleUniversity/packer-provisioner-goss/releases/download/v3.1.4/packer-provisioner-goss-v3.1.4-linux-amd64.tar.gz && \
    tar -xvzf packer-provisioner-goss-v3.1.4-linux-amd64.tar.gz && \
    mv packer-provisioner-goss /root/.packer.d/plugins/ && \
    rm -vf README.md LICENSE packer-provisioner-goss-v3.1.4-linux-amd64.tar.gz

ENTRYPOINT [ "bash" ]