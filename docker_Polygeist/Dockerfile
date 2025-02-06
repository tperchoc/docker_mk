# Use an official Ubuntu as a parent image
FROM ubuntu:20.04

# Set environment variables to non-interactive for apt
ENV DEBIAN_FRONTEND=noninteractive

# Set the time zone
ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    ninja-build \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    wget \
    ccache \
    python3.8 \
    python3.8-venv \
    python3.8-dev \
    clang \
    lld \
    libedit-dev \
    libxml2-dev \
    libncurses5-dev \
    swig \
    libtinfo-dev \
    curl \
    unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install CMake from Kitware
RUN wget https://github.com/Kitware/CMake/releases/download/v3.22.1/cmake-3.22.1-linux-x86_64.sh -O /tmp/cmake-install.sh && \
    chmod +x /tmp/cmake-install.sh && \
    /tmp/cmake-install.sh --skip-license --prefix=/usr/local && \
    rm /tmp/cmake-install.sh

# Clone the LLVM project repository
RUN git clone https://github.com/llvm/llvm-project.git /llvm-project

# Create a build directory for LLVM
RUN mkdir /llvm-project/build

# Set the working directory
WORKDIR /llvm-project/build

# Configure the build with CMake
RUN cmake -G Ninja ../llvm \
    -DLLVM_ENABLE_PROJECTS="mlir;clang" \
    -DLLVM_TARGETS_TO_BUILD="host" \
    -DLLVM_ENABLE_ASSERTIONS=ON \
    -DCMAKE_BUILD_TYPE=DEBUG \
    -DLLVM_USE_LINKER=lld

# Build LLVM, MLIR, and Clang
RUN ninja
RUN ninja check-mlir

# Clone the Polygeist repository
WORKDIR /
RUN git clone --recursive https://github.com/llvm/Polygeist.git /Polygeist

# Create a build directory for Polygeist
RUN mkdir /Polygeist/build

# Set the working directory
WORKDIR /Polygeist/build

# Configure the build with CMake
RUN cmake -G Ninja .. \
    -DMLIR_DIR=/llvm-project/build/lib/cmake/mlir \
    -DCLANG_DIR=/llvm-project/build/lib/cmake/clang \
    -DLLVM_TARGETS_TO_BUILD="host" \
    -DLLVM_ENABLE_ASSERTIONS=ON \
    -DCMAKE_BUILD_TYPE=DEBUG \
    -DPOLYGEIST_USE_LINKER=lld

# Build Polygeist
RUN ninja
RUN ninja check-polygeist-opt && ninja check-cgeist

# Set the entry point to a shell for debugging
CMD ["/bin/bash"]