## 🐳 Docker

The Docker image for MLIR-CGRA is available and can be used for development. Follow the steps below to set up and use the Docker container.

### 📥 Pulling the Docker Image

To pull the Docker image, use the following command:

```sh
docker pull cgra/mlir-cgra:demo
```

### 🚀 Running the Docker Container

To run the Docker container, use the following command:

```sh
docker run -it cgra/mlir-cgra:demo
```

### 🔧 Setting Up the Environment

Once you are inside the container, set up the environment by running:

```sh
source /setup.sh
```

### 🛠️ Building the Docker Image

To build the Docker image, you need to download the required `.whl` files from the repository. These files are necessary for the installation of specific versions of `torch` and `torch-mlir`.

1. **Download the `.whl` files:**

    ```sh
    wget https://github.com/llvm/torch-mlir/releases/download/snapshot-20221015.627/torch-1.14.0.dev20221014+cpu-cp39-cp39-linux_x86_64.whl
    wget https://github.com/llvm/torch-mlir/releases/download/snapshot-20221015.627/torch_mlir-20221015.627-cp39-cp39-linux_x86_64.whl
    ```

2. **Build the Docker image:**

    ```sh
    docker build -t docker_xdsl-dev .
    ```

### 🏃 Execution

In this repository, we provide scripts for one demo and four ML models (CamemBERT, MiniLM, SENTENCE-BERT, VIT).

#### 🎬 Running the Demo

To run the demo:

1. **Baseline:**

    ```sh
    cd experiments/demo/baseline
    sh script.sh
    ./simulate
    ```

2. **Enable optimization:**

    ```sh
    cd ../cgra
    sh script.sh
    ./simulate
    ```

    *Note:* The input is generated from `experiments/demo/model`, which requires `onnx-mlir` and `iree`. You can also use other front-ends (e.g., `torch-mlir`, `xla`, `mhlo`) as long as they can lower the model into the `linalg` dialect.

#### 🧠 Running a MiniLM Model

To run a MiniLM model:

1. **Generate the model:**

    ```sh
    cd experiments/MiniLM/model
    python3.9 MiniLM.py
    ```

2. **Move the generated `linalg.mlir` file for evaluation:**

    ```sh
    mv 02-linalg.mlir ../cgra/. && cd ../cgra
    ```

3. **Run the evaluation script:**

    ```sh
    sh script4x4.sh
    ./simulate
    ```

