# CGRA Flow 🚀

## Introduction

CGRA Flow is a toolset for working with Coarse-Grained Reconfigurable Arrays (CGRAs). This guide will help you set up and use CGRA Flow using Docker.

## Prerequisites 📋

- Docker installed on your machine
- X11 server running (for GUI applications)
Votre `README.md` semble très complet et bien structuré ! Voici quelques suggestions mineures pour améliorer encore la clarté et l'accessibilité :

1. **Lien vers Docker Hub** :
   - Ajoutez un lien direct vers la page Docker Hub dans la section "Docker Image 📦".

```markdown
## Docker Image 📦

The Docker image for CGRA Flow is available on Docker Hub:
- **Docker Hub**: cgra/cgra-flow
- **Pull the image**:
  ```bash
  docker pull cgra/cgra-flow:20241028
  ```
```

2. **Lien vers la licence** :
   - Ajoutez des liens directs vers les pages de la licence dans la section "License 📜".

```markdown
## License 📜

CGRA Flow is offered under the terms of the Open Source Initiative BSD 3-Clause License. More information about this license can be found here:
- Choose a License
- Open Source Initiative
```

3. **Lien vers le dépôt GitHub** :
   - Ajoutez un lien direct vers le dépôt GitHub dans la section "References 🔗".

```markdown
## References 🔗

- CGRA-Flow GitHub Repository
```

Ces modifications permettront aux utilisateurs d'accéder plus facilement aux ressources mentionnées. Si vous avez d'autres questions ou besoin d'aide supplémentaire, n'hésitez pas à demander ! 😊
## Installation 🛠️
   ```bash
   docker pull tperoc/cgra-flow
   ```
1. **Allow Docker to access your X server**:
   ```bash
   xhost +local:docker
   ```

2. **Run the CGRA Flow Docker container**:
   ```bash
   docker run -it --name cgra-flow-container -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix cgra/cgra-flow:20241028
   ```

## Usage 🚀

1. **Activate the virtual environment**:
   ```bash
   source /WORK_REPO/venv/bin/activate
   ```

2. **Navigate to the CGRA Flow directory**:
   ```bash
   cd CGRA-Flow/
   ```

3. **Launch CGRA Flow**:
   ```bash
   python launch.py
   ```

## Docker Image 📦

The Docker image for CGRA Flow is available on Docker Hub:
- **Docker Hub**: cgra/cgra-flow
- **Pull the image**:
  ```bash
  docker pull cgra/cgra-flow:20241028
  ```

## Citation 📚

If you use CGRA Flow in your research, please cite the following paper:

```bibtex
@inproceedings{tan2020opencgra,
  title={OpenCGRA: An open-source unified framework for modeling, testing, and evaluating CGRAs},
  author={Tan, Cheng and Xie, Chenhao and Li, Ang and Barker, Kevin J and Tumeo, Antonino},
  booktitle={2020 IEEE 38th International Conference on Computer Design (ICCD)},
  pages={381--388},
  year={2020},
  organization={IEEE}
}
```

## License 📜

CGRA Flow is offered under the terms of the Open Source Initiative BSD 3-Clause License. More information about this license can be found here:
- Choose a License
- Open Source Initiative

## Additional Information ℹ️

- **Stopping the container**:
  To stop the running container, use:
  ```bash
  docker stop cgra-flow-container
  ```

- **Restarting the container**:
  To restart the container, use:
  ```bash
  docker start -i cgra-flow-container
  ```

- **Removing the container**:
  To remove the container, use:
  ```bash
  docker rm cgra-flow-container
  ```

## Contributing 🤝

We welcome contributions! Please feel free to submit issues, fork the repository, and send pull requests.

## Acknowledgements 🙏

Special thanks to all the contributors and the open-source community!

## References 🔗

- CGRA-Flow GitHub Repository

---

Feel free to reach out if you have any questions or need further assistance. Happy coding! 😊
