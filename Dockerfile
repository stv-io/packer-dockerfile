FROM hashicorp/packer:1.10.2
LABEL org.opencontainers.image.description packer
ARG ARCH=
RUN apk add --no-cache -q curl=8.5.0-r0 jq=1.7.1-r0 bash=5.2.21-r0 && \
    mkdir -p /root/.packer.d/plugins/ && \
    curl -sLO https://github.com/YaleUniversity/packer-plugin-goss/releases/download/v3.2.8/packer-plugin-goss_v3.2.8_x5.0_linux_${ARCH}.zip && \
    unzip packer-plugin-goss_v3.2.8_x5.0_linux_${ARCH}.zip && \
    mv packer-plugin-goss_v3.2.8_x5.0_linux_${ARCH} /bin/packer-provisioner-goss && \
    rm -vf README.md LICENSE packer-plugin-goss_v3.2.8_x5.0_linux_${ARCH}.zip
ENTRYPOINT [ "/bin/packer" ]
