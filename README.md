# webdev
Docker image for web development; saves user from installing git, node, etc.

Includes:
* git
* vim
* nodejs and npm with the following installed:
** create-react-app

* AWS cli

It's meant to be used from the root directory of a project; you can do so using the published image, with no prior installs other than Docker. To use npm, create-react-app, and other tools, be in your project's directory and log in like this:
```bash
docker run -it -v $( pwd ):/www rcbrown/webdev bash
```
Consider adding any common `npm install -g`s to the Dockerfile.

To build:
```bash
docker build -t rcbrown/webdev .
```

To tag (substitute appropriate version for `0.0.1`):
```bash
docker tag rcbrown/webdev rcbrown/webdev:0.0.1
```

To push to Docker Hub:
```bash
docker push rcbrown/webdev:0.0.1
docker push rcbrown/webdev:latest
```
