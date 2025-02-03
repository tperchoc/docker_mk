# MLIR Docker Environment 🚀

## Introduction

This repository provides a Docker environment for working with MLIR (Multi-Level Intermediate Representation). The Dockerfile sets up a complete environment with all necessary dependencies and tools to build and test MLIR.

## Prerequisites 📋

- Docker installed on your machine

## Installation 🛠️

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your_username/mlir-docker.git
   cd mlir-docker
   ```

2. **Build the Docker image**:
   ```bash
   docker build -t your_dockerhub_username/mlir-env:latest .
   ```

## Usage 🚀

1. **Run the Docker container**:
   ```bash
   docker run -it --name mlir-container your_dockerhub_username/mlir-env:latest
   ```

2. **Access the MLIR environment**:
   - Once inside the container, you can start using MLIR and other installed tools.

## Tools Installed 🛠️

The Docker image includes the following tools and dependencies:

- **Git**
- **Ninja Build System**
- **Build Essentials**
- **CMake**
- **Clang and LLD**
- **Python 3.8 and related packages**
- **LLVM and MLIR**

## Building and Testing MLIR 🧪

1. **Clone the LLVM project repository**:
   ```bash
   git clone https://github.com/llvm/llvm-project.git /llvm-project
   ```

2. **Create a build directory**:
   ```bash
   mkdir /llvm-project/build
   cd /llvm-project/build
   ```

3. **Configure the build with CMake**:
   ```bash
   cmake -G Ninja ../llvm \
       -DLLVM_ENABLE_PROJECTS="mlir" \
       -DLLVM_BUILD_EXAMPLES=ON \
       -DLLVM_TARGETS_TO_BUILD="Native;NVPTX;AMDGPU" \
       -DCMAKE_BUILD_TYPE=Release \
       -DLLVM_ENABLE_ASSERTIONS=ON \
       -DLLVM_ENABLE_LLD=ON \
       -DLLVM_CCACHE_BUILD=ON \
       -DLLVM_USE_SANITIZER="Address;Undefined" \
       -DMLIR_INCLUDE_INTEGRATION_TESTS=ON
   ```

4. **Build all targets**:
   ```bash
   cmake --build . --target all
   ```

5. **Run MLIR tests**:
   ```bash
   cmake --build . --target check-mlir || true
   ```

## Docker Image 📦

The Docker image for MLIR is available on Docker Hub:
- **Docker Hub**: your_dockerhub_username/mlir-env
- **Pull the image**:
  ```bash
  docker pull your_dockerhub_username/mlir-env:latest
  ```

## License 📜

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgements 🙏

Special thanks to all the contributors and the open-source community!

---

Feel free to reach out if you have any questions or need further assistance. Happy coding! 😊