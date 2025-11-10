#!/bin/bash

# Script pour créer la structure de dossiers du projet

echo "Création de la structure de dossiers..."

mkdir -p electron
mkdir -p frontend/src/routes
mkdir -p microservices
mkdir -p business-logic/domain
mkdir -p business-logic/services
mkdir -p scripts

# Fichiers vides avec commentaires

echo '// Création de la fenêtre' > electron/main.ts
echo '// Bridge sécurisé' > electron/preload.ts

# Pour svelte routes, on crée un fichier vide .gitkeep pour garder le dossier
touch frontend/src/routes/.gitkeep

echo '// Service NATS GSN' > microservices/gsn-service.ts
echo '// Service NATS Simulation' > microservices/simulation-service.ts
echo '// Service NATS Validation' > microservices/validation-service.ts
echo '// Service NATS File' > microservices/file-service.ts

echo '// Types des éléments GSN' > business-logic/domain/gsn-types.ts
echo '// Classe GSN et logique métier associée' > business-logic/domain/gsn.ts

# Pour services métier, on crée un fichier vide .gitkeep
touch business-logic/services/.gitkeep

# Fichiers de config vides
touch frontend/svelte.config.js
touch frontend/tsconfig.json
touch package.json
touch tsconfig.json

echo "Structure créée avec succès."