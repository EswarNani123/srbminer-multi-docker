#!/bin/bash
# Define image name, version and registries
image="srbminer-multi"
version="2.7.9"
registries=("docker.io" "ghcr.io" "quay.io")

# Build the image
docker build . --build-arg VERSION_TAG=$version --tag ${registries[0]}/EswarNani123/$image:$version

# Check if the command was successful
if [ $? -ne 0 ]; then
  echo "Docker build failed!"
  exit 1
fi

echo "Docker build succeeded!"

# Tag and push the images
for registry in "${registries[@]}"; do
  docker tag ${registries[0]}/EswarNani123/$image:$version $registry/EswarNani123/$image:$version
  docker tag ${registries[0]}/EswarNani123/$image:$version $registry/EswarNani123/$image:latest
  
  # Push both versioned and latest tags
  docker push $registry/EswarNani123/$image:$version
  docker push $registry/EswarNani123/$image:latest
done

