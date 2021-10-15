# Default the build id to "local" unless a commandline parameter is specified
IMAGE_NAME=${1:-lawisnie/azdeploy}
BUILD_ID=${2:-local}

docker buildx create --name azure --use
docker buildx build --tag $IMAGE_NAME:$BUILD_ID --push --progress plain --platform linux/amd64 .
docker buildx rm azure