# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG OWNER
ARG BASE_CONTAINER=$OWNER/datascience-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Yuuta Sakurai <sakurai@andrew.ac.jp>"

# Set when building on Travis so that certain long-running build steps can
# be skipped to shorten build time.
ARG TEST_ONLY_BUILD

# Fix DL4006
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER root

RUN apt-get -q update \
    && apt-get install -yq --no-install-recommends \
    libmecab-dev \
    libmecab2 \
    mecab \
    mecab-ipadic \
    mecab-ipadic-utf8 \
    mecab-utils \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN cp /usr/lib/aarch64-linux-gnu/libmecab.* /opt/conda/lib/
RUN R -e 'install.packages("RMeCab",repos="https://rmecab.jp/R/",type="source",lib="/opt/conda/lib/R/library")'

USER $NB_UID

RUN mamba install --quiet --yes \
    'conda-forge::mecab-python3' && \
    conda clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

WORKDIR $HOME
