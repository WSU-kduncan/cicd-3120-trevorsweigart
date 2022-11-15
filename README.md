# Project Overview

- The point of this project is to be able to host a docker container for ease
of hosting a project on any machine as applications run on an isolated environment
and are easily transferable as all dependencies are linked to the docker container.

# Run Project Locally

- Installed docker: `sudo apt install docker`

- Build container: `docker build -t nginx_image .`

- Running the container: `docker run -it --rm -d -p 8080:80 --name web nginx_image`

- Viewing the running project:
  - Open a browser and go to `http://localhost:8080/`
