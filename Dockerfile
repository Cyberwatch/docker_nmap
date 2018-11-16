# Use Debian Stretch
FROM debian:9-slim

# Pick one nmap version
ARG NMAP_VERSION="7.70"

# Dependence to build nmap
ENV BUILD_DEPS="build-essential wget ca-certificates" \
    APPLICATION_DEPS="openssl libssl-dev"

WORKDIR /nmap

RUN apt update \
  && apt install -qq -y --no-install-recommends $BUILD_DEPS $APPLICATION_DEPS \
  && wget -q https://nmap.org/dist/nmap-$NMAP_VERSION.tar.bz2 \
  && bzip2 -cd nmap-$NMAP_VERSION.tar.bz2 | tar xvf - > /dev/null \
  && cd nmap-$NMAP_VERSION \
  && ./configure \
  && make \
  && make install \
  && cd .. \
  && rm nmap-$NMAP_VERSION.tar.bz2 \
  && rm -R nmap-$NMAP_VERSION \
  && apt purge -yq $BUILD_DEPS \
  && apt clean -yq \
  && apt autoremove -yq \
  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["nmap"]
