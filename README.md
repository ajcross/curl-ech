# curl-ech

A simple Dockerfile to build curl with experimental ECH enabled

it can be tested with:

```
podman run curl-ech -v --doh-url https://8.8.8.8/dns-query --ech hard https://test.defo.ie/echstat.php?format=json 
```
