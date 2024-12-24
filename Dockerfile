# Use a base image with Ubuntu
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Update and install prerequisites
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    software-properties-common \
    apt-transport-https \
    build-essential \
    && apt-get clean

# Install Python
RUN apt-get install -y python3 python3-pip

# Install GCC
RUN apt-get install -y gcc

# Install JDK
RUN apt-get install -y openjdk-11-jdk

# Install Visual Studio Code
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg \
    && mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg \
    && sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' \
    && apt-get update && apt-get install -y code

# Default command to keep the container running
CMD [ "bash" ]
