#!/bin/bash

docker buildx build --platform=linux/amd64,linux/arm64 \
                    --progress=plain \
                    -t ninepeach/test --push .