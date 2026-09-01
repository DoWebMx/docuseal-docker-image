#!/bin/bash
# CREATED BY RUBEN TRUJILLO - ABR 01 2026
# UPDATED BY RUBEN TRUJILLO - SEP 01 2026
clear

# VARIABLES
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ENV_FILE="$SCRIPT_DIR/.env"
source "$ENV_FILE"

echo "----------------------------------------------"
echo " DOWEBMX DOCUSEAL BUILD IMAGE STARTED "
echo "----------------------------------------------"

# docker image ls
# docker image rm -f dowebmx/docuseal

echo "v${DOCUSEAL_VERSION}-DoWebMx-rev-${REVISION}" > ./version

docker image prune -f
docker builder prune -f
docker system prune -a -f

# Opción limpia: Detiene y elimina solo si existen contenedores previos
docker ps -a -q --filter ancestor=dowebmx/docuseal | xargs -r docker stop
docker ps -a -q --filter ancestor=dowebmx/docuseal | xargs -r docker rm

# docker build --no-cache --pull -t dowebmx/docuseal:latest .
# docker build --pull --no-cache -f Dockerfile.custom -t dowebmx/docuseal:latest .
docker build --pull --no-cache \
  --build-arg COMPANY_NAME="DoWebMx" \
  --build-arg APP_NAME="Portal de Firma Digital" \
  --build-arg APP_DESCRIPTION="Plataforma para la gestión, validación y firma electrónica de documentos digitales." \
  --build-arg APP_URL="https://www.doweb.mx" \
  -f Dockerfile.custom \
  -t dowebmx/docuseal:${DOCUSEAL_VERSION}-DoWebMx-rev-${REVISION} \
  -t dowebmx/docuseal:latest \
  ..

docker save -o ./target/dowebmx-docuseal.tar dowebmx/docuseal:latest
# docker save -o dowebmx-erp.tar dowebmx/cloud-erp:${DOLI_VERSION}-php${PHP_VERSION}-rev${REVISION} dowebmx/cloud-erp:latest

docker image ls

rm version

# docker run --rm dowebmx/docuseal:latest cat /app/app/views/pages/landing.html.erb
# docker run --rm dowebmx/docuseal:latest cat /app/app/views/shared/_powered_by.html.erb

echo "------------------------------------------------"
echo " DOWEBMX DOCUSEAL BUILD IMAGE COMPLETED "
echo "------------------------------------------------"