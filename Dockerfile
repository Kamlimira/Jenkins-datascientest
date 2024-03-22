# Dockerfile to build a Flask app

# Utilise l'image Python 3.8 Slim Buster comme image de base
FROM python:3.8-slim-buster

# Définit le répertoire de travail dans le conteneur
WORKDIR /usr/

# Copie le fichier requirements.txt du répertoire local vers le répertoire de travail du conteneur
COPY requirements.txt requirements.txt

# Installe les dépendances Python à partir du fichier requirements.txt
RUN pip install -r requirements.txt

# Copie tous les fichiers du répertoire local vers le répertoire de travail du conteneur
COPY . .

# Commande par défaut pour exécuter l'application Flask
CMD ["python", "-m", "flask", "run"]
