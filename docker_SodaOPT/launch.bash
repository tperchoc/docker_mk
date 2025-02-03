#!/bin/bash

# Définir les variables
IMAGE_TAR="soda_image.tar"
IMAGE_NAME="agostini01/soda:latest"
CONTAINER_NAME="soda_container"

# Naviguer vers le répertoire du script
cd "$(dirname "$0")"

# Charger l'image Docker à partir du fichier tar
docker load -i $IMAGE_TAR

# Exécuter le conteneur Docker
docker run -it --rm --name $CONTAINER_NAME -v "$(pwd)":/app $IMAGE_NAME

# Afficher un message de succès
echo "Le conteneur Docker a été lancé avec succès."