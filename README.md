# Jekyll environment for Docker

Extremely helpful Jekyll build and serve environment using Docker.

## Environment Variables

- `TARGET_REPO` - Selects the repository that should be cloned when nothing is bind mounted.
- `TARGET_BRANCH` - Selects the branch on the selected repository to be cloned.

## Volume Locations

- `/site` - Directory where Jekyll will look for content.

## Docker Container

Pull a ready to use Docker image from [Docker Hub](https://hub.docker.com/r/raveious/jekyll-website) and run a Jekyll server locally which will also clone the master branch of this repository.
```
$ docker run -v $PWD:/site -p 80:4000 -it raveious/jekyll-website
```

## Docker Compose

Here is an example of a Docker Compose file to start everything up correctly.
```
version: '2'

services:
  jekyll:
    image: raveious/jekyll-website
    volumes:
      - .:/site
    ports:
      - '80:4000'
    environment:
      - TARGET_REPO=https://github.com/raveious/raveious.github.io.git
      - TARGET_BRANCH=master
```
