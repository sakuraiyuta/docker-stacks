#!/bin/bash

declare -a IMAGES=(base-notebook datascience-notebook minimal-notebook r-notebook scipy-notebook tensorflow-notebook all-spark-notebook pyspark-notebook)

for IMAGE in ${IMAGES[@]}; do
  cp master/${IMAGE}/Dockerfile ./${IMAGE}
done
