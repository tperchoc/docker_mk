# Utiliser une image de base Ubuntu
FROM ubuntu:20.04

# Définir le fuseau horaire
ENV TZ=Asia/Singapore
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Installer les dépendances nécessaires
RUN apt-get update && apt-get install -y \
    software-properties-common \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update && apt-get install -y \
    python3.7 \
    python3.7-venv \
    python3.7-dev \
    graphviz \
    git \
    libffi-dev \
    make \
    autoconf \
    g++ \
    libfl-dev \
    bison \
    wget

# Mettre à jour les alternatives pour utiliser python3.7 par défaut
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 1

# Installer Verilator
RUN mkdir -p /home/src && \
    cd /home/src && \
    wget http://www.veripool.org/ftp/verilator-4.036.tgz && \
    tar -xzvf verilator-4.036.tgz && \
    cd verilator-4.036 && \
    ./configure && \
    make && \
    make install

# Créer et activer l'environnement virtuel
RUN python3 -m venv /home/venv

# Activer l'environnement virtuel et installer PyMTL3 et les autres dépendances Python
RUN /bin/bash -c "source /home/venv/bin/activate && \
    pip install git+https://github.com/tancheng/pymtl3.git && \
    pip install --upgrade pip setuptools twine && \
    pip install hypothesis && \
    pip install pytest && \
    pip install --upgrade py"

# Cloner le dépôt OpenCGRA
RUN mkdir -p /home/cgra && \
    cd /home/cgra && \
    git clone https://github.com/pnnl/OpenCGRA.git

# Définir le répertoire de travail
WORKDIR /home/cgra/OpenCGRA

# Commande par défaut pour lancer un test
CMD /bin/bash -c "source /home/venv/bin/activate && cd cgra/test/ && pytest --tb=short -sv CGRARTL_test.py && /bin/bash"
