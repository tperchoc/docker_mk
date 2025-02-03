#!/bin/bash

# Définir les variables
IMAGE_TAR="cgra-flow-20241028.tar"
IMAGE_NAME="cgra/cgra-flow:20241028"
CONTAINER_NAME="cgra-flow-container"

# Naviguer vers le répertoire du script
cd "$(dirname "$0")"

# Charger l'image Docker à partir du fichier tar
docker load -i $IMAGE_TAR

# Autoriser les connexions locales à l'affichage X11
xhost +local:docker

# Exécuter le conteneur Docker avec les paramètres d'affichage
docker run -it --rm --name $CONTAINER_NAME -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix $IMAGE_NAME