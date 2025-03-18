# curl-ech

A simple Dockerfile to build and publish a container with curl with **EXPERIMENTAL** Encrypted Client Hello (ECH) enabled

The resulting image is publicy available at:

```
docker.io/ajcross/curl-ech
```

it can be tested with podman:

```
podman run docker.io/ajcross/curl-ech -s --doh-url https://8.8.8.8/dns-query \
                                      --ech hard \
                                      https://test.defo.ie/echstat.php?format=json 
```

or with docker

```
docker run docker.io/ajcross/curl-ech -s --doh-url https://8.8.8.8/dns-query \
                                      --ech hard \
                                      https://test.defo.ie/echstat.php?format=json 
```
