# curl-ech

A simple Dockerfile to build curl with *EXPERIMENTAL* Encrypted Client Hello (ECH) enabled

it can be tested with:

```
podman run docker.io/ajcross/curl-ech -s --doh-url https://8.8.8.8/dns-query --ech hard https://test.defo.ie/echstat.php?format=json 
```
