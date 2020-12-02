---
title: Docker
date: 2020-12-02T11:01:41+08:00
hero: /images/anonymous/1.svg
menu:
  sidebar:
    name: Docker
    parent: notes
    # weight: 10
---

### Installation

### Alpine for Running Golang Service

`Dockerfile` like this to make base image:

```docker
FROM alpine:latest
apk add --no-cache libc6-compat
```

Run `docker build -t alpine:lib .` in console.

`Dockerfile` to make final image:

```docker
FROM alpine
```
