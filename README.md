

# CGRA Tools 🚀

Welcome to the **CGRA Tools** repository! (work in progress) This collection of Docker containers is designed for working on CGRAs (Coarse-Grained Reconfigurable Arrays).

## Table of Contents
- What is a CGRA? 🤔
- Available Docker Containers 🐳
- How to Use 🛠️
- Contributing 🤝
- License 📜
- Acknowledgements 🙏

## What is a CGRA? 🤔

A **Coarse-Grained Reconfigurable Array (CGRA)** is a type of reconfigurable computing architecture consisting of an array of programmable processing elements. Unlike FPGAs, which operate at the bit level, CGRAs operate at a higher level of granularity, making them more efficient for certain computations. CGRAs are well-suited for applications in signal processing, cryptography, and machine learning.

## Available Docker Containers 🐳

- **docker_CGRAFlow** 📂
  - `launch.bash`
  - `Run_CGRA-flow.txt`

- **docker_MLIR** 📂
  - `Dockerfile`

- **docker_OpenCGRA** 📂
  - `Dockerfile`
  - `install_command.txt`

- **docker_SodaOPT** 📂
  - `launch.bash`
  - `tools_available.txt`

- **docker_Tuto** 📂
  - `Dockerfile`
  - `main.py`

## How to Use 🛠️

1. Clone the repository:
   ```bash
   git clone https://github.com/tperchoc/docker_mk.git
   cd docker_mk
   ```

2. Build the Docker image for the desired tool:
   ```bash
   cd docker_<tool_name>
   docker build -t <image_name> .
   ```

3. Run the Docker container:
   ```bash
   docker run -it <image_name>
   ```

## Contributing 🤝

We welcome contributions! Please submit issues, fork the repository, and send pull requests.

## License 📜

This project is licensed under the MIT License.

## Acknowledgements 🙏

Special thanks to all contributors and the open-source community!

---

Feel free to reach out if you have any questions or need further assistance. Happy coding! 😊

