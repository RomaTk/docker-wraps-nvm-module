ARG BASED_ON="ubuntu:latest"
FROM $BASED_ON

ARG PREFIX=""
RUN echo "Using prefix ${PREFIX}"
ARG VERSION=""
RUN echo "Using version ${VERSION}"

WORKDIR /working-env/nvm

COPY ./saved-versions/${VERSION}.tar.gz ./saved-versions/${VERSION}.tar.gz
COPY ./install.sh ./install.sh

RUN chmod +x ./install.sh
RUN ./install.sh "${VERSION}" "${PREFIX}"

RUN rm -rf ./install.sh
RUN rm -rf ./saved-versions
