

# CGRA Tools 🚀

Welcome to the **CGRA Tools** repository! Here you will find a collection of ready-to-use Docker containers for working on CGRAs (Coarse-Grained Reconfigurable Arrays).

## Table of Contents
- What is a CGRA? 🤔
- Available Docker Containers 🐳
- How to Use 🛠️
- Interactive Features ✨
- Contributing 🤝
- License 📜
- Acknowledgements 🙏

## What is a CGRA? 🤔

A **Coarse-Grained Reconfigurable Array (CGRA)** is a type of reconfigurable computing architecture that consists of an array of programmable processing elements. Unlike FPGAs (Field-Programmable Gate Arrays), which are fine-grained and operate at the bit level, CGRAs operate at a higher level of granularity, making them more efficient for certain types of computations. CGRAs are particularly well-suited for applications in signal processing, cryptography, and machine learning.

!CGRA Diagram

## Available Docker Containers 🐳

- **docker_CGRAFlow** 📂
  - `cgra-flow-20241028.tar` (not included due to size)
  - `launch.bash`
  - `Run_CGRA-flow.txt`

- **docker_MLIR** 📂
  - `Dockerfile`

- **docker_OpenCGRA** 📂
  - `Dockerfile`
  - `install_command.txt`

- **docker_SodaOPT** 📂
  - `launch.bash`
  - `soda_image.tar` (not included due to size)
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

## Interactive Features ✨

### Interactive Documentation with Jupyter Notebooks
You can explore interactive examples and tutorials using Jupyter Notebooks. To start a Jupyter Notebook server, run the following command inside the Docker container:
```bash
jupyter notebook --ip=0.0.0.0 --port=8888 --allow-root
```
Access the notebook in your browser at `http://localhost:8888`.

### Real-Time Collaboration with Live Share
Enable real-time collaboration on your code using Visual Studio Code's Live Share extension. This allows multiple users to work on the same codebase simultaneously.

### Dynamic Visualizations
Integrate dynamic visualizations using tools like Plotly or Bokeh. Here's an example of how to create a simple interactive plot:

```python
import plotly.express as px

# Sample data
df = px.data.iris()

# Create a scatter plot
fig = px.scatter(df, x='sepal_width', y='sepal_length', color='species')

# Show the plot
fig.show()
```

## Contributing 🤝

We welcome contributions! Please feel free to submit issues, fork the repository, and send pull requests. Check out our contributing guidelines for more details.

## License 📜

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgements 🙏

Special thanks to all the contributors and the open-source community!

---

Feel free to reach out if you have any questions or need further assistance. Happy coding! 😊

