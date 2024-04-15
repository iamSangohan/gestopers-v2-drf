#!/bin/bash

# Créer un environnement virtuel
python3 -m venv env
env/bin/activate

# Installer Django et Django Rest Framework
pip install django djangorestframework

# Créer un nouveau projet Django
django-admin startproject $1 .

# Créer une nouvelle application
python manage.py startapp $2

# Ajouter l'application et le framework à la liste des applications installées
echo "INSTALLED_APPS += ['$2', 'rest_framework']" >> $1/settings.py

# Créer un serializer et le fichier urls
touch $2/serializers.py
touch $2/urls.py

# Installe les dépendances
pip install django-cors-headers

# Ajouter les middlewares
echo "MIDDLEWARE += ['corsheaders.middleware.CorsMiddleware']" >> $1/settings.py

# Ajouter les paramètres de configuration pour CORS

echo "  # Configuring CORS
        CORS_ALLOW_ALL_ORIGINS = True # If this is used then `CORS_ALLOWED_ORIGINS` will not have any effect
        CORS_ALLOW_CREDENTIALS = True
        CORS_ALLOWED_ORIGINS = [
            'http://0.0.0.0',
        ] # If this is used, then not need to use `CORS_ALLOW_ALL_ORIGINS = True`
        CORS_ALLOWED_ORIGIN_REGEXES = [
            'http://0.0.0.0',
        ]" >> $1/settings.py

# Creer le requirements.txt
pip freeze > requirements.txt

# Lancer le serveur de développement
python manage.py runserver