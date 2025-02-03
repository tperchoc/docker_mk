# Utiliser une image de base Ubuntu
FROM ubuntu:20.04

# Définir le fuseau horaire
ENV TZ=Asia/Singapore
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Installer les dépendances de base
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    wget \
    python3.9 \
    python3.9-distutils \
    clang-12 \
    llvm-12 \
    ninja-build

# Installer pip pour Python 3.9
RUN wget https://bootstrap.pypa.io/get-pip.py && python3.9 get-pip.py

# Cloner et construire LLVM et MLIR
RUN git clone https://github.com/llvm/llvm-project.git /llvm-project && \
    cd /llvm-project && \
    git checkout 99020b3c73c1e22fa388be8fd0c44391d40b3a38 && \
    mkdir build && cd build && \
    cmake -G Ninja ../llvm \
        -DLLVM_ENABLE_PROJECTS=mlir \
        -DLLVM_BUILD_EXAMPLES=ON \
        -DLLVM_TARGETS_TO_BUILD="X86;NVPTX;AMDGPU" \
        -DCMAKE_BUILD_TYPE=Release \
        -DLLVM_ENABLE_ASSERTIONS=ON \
        -DLLVM_INSTALL_UTILS=ON && \
    cmake --build . --target check-mlir

# Définir les variables d'environnement pour LLVM et MLIR
ENV BUILD_DIR=/llvm-project/build
ENV PREFIX=/llvm-project/build
ENV PATH="$BUILD_DIR/bin:$PATH"

# Cloner et construire MLIR-CGRA
RUN git clone https://github.com/tancheng/mlir-cgra.git /mlir-cgra && \
    cd /mlir-cgra && \
    mkdir build && cd build && \
    cmake -G Ninja .. \
        -DLLVM_EXTERNAL_LIT=$BUILD_DIR/bin/llvm-lit \
        -DMLIR_DIR=$PREFIX/lib/cmake/mlir && \
    cmake --build . --target check-soda

# Copier les fichiers .whl dans l'image Docker
COPY torch-1.14.0.dev20221014+cpu-cp39-cp39-linux_x86_64.whl /tmp/
COPY torch_mlir-20221015.627-cp39-cp39-linux_x86_64.whl /tmp/

# Installer les packages Python nécessaires
RUN pip3.9 install /tmp/torch-1.14.0.dev20221014+cpu-cp39-cp39-linux_x86_64.whl && \
    pip3.9 install /tmp/torch_mlir-20221015.627-cp39-cp39-linux_x86_64.whl && \
    pip3.9 install transformers

# Copier les fichiers de l'application (si nécessaire)
# COPY . /app

# Définir le répertoire de travail
WORKDIR /mlir-cgra

# Exposer le port si nécessaire (par exemple, pour une application web)
# EXPOSE 5000

# Définir la commande de démarrage par défaut
CMD ["/bin/bash"]