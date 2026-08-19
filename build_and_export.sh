docker image ls

docker image rm -f dowebmx/docuseal:latest

docker image prune -f
docker builder prune -f
docker system prune -a -f
# docker build --no-cache -t dowebmx/docuseal:latest .
docker build --no-cache --pull -t dowebmx/docuseal:latest .

docker save -o ./target/dowebmx-docuseal.tar dowebmx/docuseal:latest

docker image ls