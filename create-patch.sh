#!/bin/bash

ARCH="aarch64"
declare -a IMAGES=(base-notebook datascience-notebook minimal-notebook r-notebook scipy-notebook tensorflow-notebook all-spark-notebook pyspark-notebook)

for IMAGE in ${IMAGES[@]}; do
  cd ${IMAGE}

  ORIG=Dockerfile
  NEW=Dockerfile.${ARCH}

  if [ -e Dockerfile.orig ]; then
      ORIG=Dockerfile.orig
  fi

  # ignore timestamp
  diff -u --label ${ORIG} ${ORIG} --label ${NEW} ${NEW} > Dockerfile.${ARCH}.patch

  cd ..
done
