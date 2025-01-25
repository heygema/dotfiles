# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Set environment variables to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install common dev tools
RUN apt-get update && apt-get install -y \
    git \
    curl \
    vim \
    build-essential \
    python3 \
    python3-pip \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# Install fnm (Fast Node Manager) for Node.js version management
RUN curl -fsSL https://fnm.vercel.app/install | bash

# Add fnm to the PATH
ENV PATH="/root/.local/share/fnm:$PATH"

# Install the latest LTS version of Node.js using fnm
RUN fnm install --lts && fnm use lts-latest

# Install Rust using rustup
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Add Rust to the PATH
ENV PATH="/root/.cargo/bin:$PATH"

# Set up a workspace
WORKDIR /workspace

# Default command (optional)
CMD ["bash"]

