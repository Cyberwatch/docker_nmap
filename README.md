# Docker Image for NMAP

Build an use a container image from the nmap source

## Build from source

Build the last release

```sh
docker build -t nmap .
```

Build a specific version

```sh
docker build -t nmap --build-arg NMAP_VERSION="7.60" .
```

## Use the image

```sh
docker run -rm nmap [classic nmap params]
```
