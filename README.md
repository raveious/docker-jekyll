# Jekyll environment for Docker

Extremely helpful Jekyll build and serve environment using Docker.

## Environment Variables

- `TARGET_REPO` - Selects the repository that should be cloned when nothing is bind mounted.
- `TARGET_BRANCH` - Selects the branch on the selected repository to be cloned. Defaults to the master branch.
- `JEKYLL_GITHUB_TOKEN` - Sets the token used by the Jekyll GitHub API to get account information. It's only needed for local development, and shouldn't be committed into the repository.

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
    env_file:
      - ./.env
```

You might not need the `env_file` section if you don't want to load extra environment variables that way. You would only want to do that if you have stuff that is specific to your local development environment, like the `JEKYLL_GITHUB_TOKEN` variable.
