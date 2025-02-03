# Use an official Ubuntu as a parent image
FROM ubuntu:20.04

# Set environment variables to non-interactive for apt
ENV DEBIAN_FRONTEND=noninteractive

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

# Download and install the latest Clang binaries
RUN wget https://github.com/llvm/llvm-project/releases/download/llvmorg-12.0.0/clang+llvm-12.0.0-x86_64-linux-gnu-ubuntu-20.04.tar.xz -O /tmp/clang.tar.xz && \
    tar -xf /tmp/clang.tar.xz -C /usr/local --strip-components=1 && \
    rm /tmp/clang.tar.xz

# Set environment variables to use Clang
ENV CC=/usr/local/bin/clang
ENV CXX=/usr/local/bin/clang++

# Clone the LLVM project repository
RUN git clone https://github.com/llvm/llvm-project.git /llvm-project

# Create a build directory
RUN mkdir /llvm-project/build

# Set the working directory
WORKDIR /llvm-project/build

# Configure the build with CMake
RUN cmake -G Ninja ../llvm \
    -DLLVM_ENABLE_PROJECTS="mlir" \
    -DLLVM_BUILD_EXAMPLES=ON \
    -DLLVM_TARGETS_TO_BUILD="Native;NVPTX;AMDGPU" \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_ENABLE_ASSERTIONS=ON \
    -DLLVM_ENABLE_LLD=ON \
    -DLLVM_CCACHE_BUILD=ON \
    -DLLVM_USE_SANITIZER="Address;Undefined" \
    -DMLIR_INCLUDE_INTEGRATION_TESTS=ON

# Build all targets
RUN cmake --build . --target all

# Build and run MLIR tests
RUN cmake --build . --target check-mlir || true

# Set the entry point to a shell for debugging
CMD ["/bin/bash"]