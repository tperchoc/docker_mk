# Use the official Ubuntu 20.04 image as a base
FROM ubuntu:20.04

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    XDSL_MLIR_OPT_PATH=/usr/local/bin/mlir-opt \
    TZ=Asia/Singapore

# Set the timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    make \
    curl \
    software-properties-common \
    && add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python3.10 python3.10-venv python3.10-dev python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Install uv tool using pip3
RUN pip3 install uv

# Clone the xDSL repository
RUN git clone https://github.com/xdslproject/xdsl.git /xdsl

# Set the working directory
WORKDIR /xdsl

# Set up the virtual environment and install dependencies
RUN python3.10 -m venv venv && \
    . venv/bin/activate && \
    pip install numpy pandas scikit-learn pre-commit pytest pytest-asyncio textual ruff

# Install the xDSL package
RUN . venv/bin/activate && pip install .

# Verify the presence of .pre-commit-config.yaml
RUN if [ ! -f .pre-commit-config.yaml ]; then echo ".pre-commit-config.yaml not found"; exit 1; fi

# Install pre-commit hooks using the full path to the pre-commit executable
RUN . venv/bin/activate && venv/bin/pre-commit install

# Set the PYTHONPATH environment variable
ENV PYTHONPATH=/xdsl

# Run tests to verify the installation
RUN . venv/bin/activate && venv/bin/pytest tests -W error -vv

# Set the entrypoint to bash
ENTRYPOINT ["/bin/bash"]