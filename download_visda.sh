#!/usr/bin/env bash
set -euo pipefail

DATA_DIR="./data"
mkdir -p "$DATA_DIR"
cd "$DATA_DIR"

echo "==> Téléchargement et extraction de train.tar (synthétique)..."
wget -c http://csr.bu.edu/ftp/visda17/clf/train.tar
tar -xf train.tar

echo "==> Téléchargement et extraction de validation.tar (réel)..."
wget -c http://csr.bu.edu/ftp/visda17/clf/validation.tar
tar -xf validation.tar

echo "==> Téléchargement et extraction de test.tar..."
wget -c http://csr.bu.edu/ftp/visda17/clf/test.tar
tar -xf test.tar

echo "==> Téléchargement de image_list.txt..."
wget -c https://raw.githubusercontent.com/VisionLearningGroup/taskcv-2017-public/master/classification/data/image_list.txt

# Décommenter pour supprimer les archives après extraction et libérer de l'espace :
# rm -f train.tar validation.tar test.tar

echo "==> Terminé. Données disponibles dans $(pwd)"
