# syntax=docker/dockerfile:1
FROM ubuntu:22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies (excluding IPFS for manual install)
RUN apt-get update && apt-get install -y \
    curl wget git make build-essential \
    ca-certificates \
    gnupg \
    lsb-release \
    apt-transport-https \
    software-properties-common \
    docker.io \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Install Go manually
ENV GO_VERSION=1.23.2
RUN wget https://go.dev/dl/go$GO_VERSION.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go$GO_VERSION.linux-amd64.tar.gz && \
    rm go$GO_VERSION.linux-amd64.tar.gz

# Add Go and Go binaries to PATH
ENV PATH="/usr/local/go/bin:/root/go/bin:$PATH"

# Install IPFS manually
RUN wget https://dist.ipfs.io/go-ipfs/v0.18.1/go-ipfs_v0.18.1_linux-amd64.tar.gz && \
    tar xvfz go-ipfs_v0.18.1_linux-amd64.tar.gz && \
    cd go-ipfs && \
    bash install.sh && \
    cd .. && rm -rf go-ipfs go-ipfs_v0.18.1_linux-amd64.tar.gz

# Clone your repositories
WORKDIR /workspace
RUN git clone https://github.com/acostarodrigo/janctionVideoRenderingModule.git videoRendering && \
    git clone https://github.com/acostarodrigo/janctionLayer1Node.git

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]