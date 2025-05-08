# SphinxSearch Docker Image (Debian-based)

A minimal Docker image for [SphinxSearch 3.3.1](http://sphinxsearch.com/) built on Debian (glibc) instead of Alpine (musl) to improve stability and compatibility.

**Docker Hub:** [https://hub.docker.com/r/crazywizard/sphinxsearch](https://hub.docker.com/r/crazywizard/sphinxsearch)

## 🛠 Build the Image

```bash
docker build -f Dockerfile -t sphinxsearch:3.3.1-debian .
```

## 📥 Pull from Docker Hub

```bash
docker pull crazywizard/sphinxsearch:3.3.1-debian
```
