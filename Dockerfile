ARG MINIFORGE_VERSION=26.1.1-2
ARG UBUNTU_VERSION=24.04
ARG CONDA_ENV_PATH=/opt/conda/envs/easypqp

FROM condaforge/miniforge3:${MINIFORGE_VERSION} AS builder

ARG CONDA_ENV_PATH
ARG EASYPQP_VERSION=0.1.59

RUN mamba create -qy -p "${CONDA_ENV_PATH}" \
    -c conda-forge -c bioconda \
    "easypqp=${EASYPQP_VERSION}" && \
    mamba clean -afy

FROM ubuntu:${UBUNTU_VERSION} AS final

ARG CONDA_ENV_PATH

COPY --from=builder "${CONDA_ENV_PATH}" "${CONDA_ENV_PATH}"

ENV CONDA_ENV_PATH="${CONDA_ENV_PATH}" \
    PATH="${CONDA_ENV_PATH}/bin:${PATH}"

RUN groupadd -g 500001 bldocker && \
    useradd -r -u 500001 -g bldocker bldocker

USER bldocker

LABEL maintainer="Your Name <YourName@sbpdiscovery.org>" \
      org.opencontainers.image.source="https://github.com/TheBoutrosLab/docker-EasyPQP" \
      org.opencontainers.image.title="EasyPQP" \
      org.opencontainers.image.description="EasyPQP peptide query parameter and spectral library generation"
