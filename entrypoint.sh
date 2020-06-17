#!/bin/sh -l

IMAGE_NAME="$INPUT_GCR_HOST/$GOOGLE_PROJECT_ID/$INPUT_IMAGE_NAME:$INPUT_IMAGE_TAG"

echo $GCLOUD_SERVICE_KEY | docker login -u _json_key --password-stdin https://$INPUT_GCR_HOST/
if [[ -z "$INPUT_IMAGE_TAG2" ]]; then
  docker build -t $IMAGE_NAME .
else
  docker build -t $IMAGE_NAME -t $INPUT_IMAGE_TAG2 .
fi

docker push $IMAGE_NAME
