#!/bin/bash

docker image ls

docker image rm -f dowebmx/docuseal:latest

docker image prune -f
docker builder prune -f
docker system prune -a -f

# Opción limpia: Detiene y elimina solo si existen contenedores previos
docker ps -a -q --filter ancestor=dowebmx/docuseal:latest | xargs -r docker stop
docker ps -a -q --filter ancestor=dowebmx/docuseal:latest | xargs -r docker rm

# docker build --no-cache --pull -t dowebmx/docuseal:latest .
# docker build --pull --no-cache -f Dockerfile.custom -t dowebmx/docuseal:latest .
docker build --pull --no-cache \
  --build-arg COMPANY_NAME="DoWebMx" \
  --build-arg APP_NAME="Portal de Firma Digital" \
  --build-arg APP_DESCRIPTION="Plataforma para la gestión, validación y firma electrónica de documentos digitales." \
  --build-arg APP_URL="https://www.doweb.mx" \
  -f Dockerfile.custom \
  -t dowebmx/docuseal:latest \
  ..

docker save -o ./target/dowebmx-docuseal.tar dowebmx/docuseal:latest

docker image ls

# docker run --rm dowebmx/docuseal:latest cat /app/app/views/pages/landing.html.erb