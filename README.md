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

# Github Actions and Dockerhub

- To create a repository, go to `https://hub.docker.com/repositories`
  -> click `Create Repository` -> Give name -> Set visibility

- To authenticate with Dockerhub via cli, in the terminal, type `docker login`

- To push a container to Dockerhub, run `docker push namespace/repo_name`

- The secrets set in Github were DOCKER_USERNAME and DOCKER_TOKEN.
    These are the username to Dockerhub as well as an access token to the
    Dockerhub repo so Github can push to it.

- The Github workflow follows the sequence of commands defined in the action file.
    In this case it is to build the Docker container and push it to Dockerhub.
    The workflow runs whenever the Github branch that has the workflow is committed
    and pushed to.

- In order for the workflow to run successfully, the variables inside the workflow file
    need to be defined. In this case it was the Dockerhub username and access token for
    Github to have access to the Dockerhub repo. In the actual workflow file, the only
    thing that is specific to the user is the name of the Dockerhub repo. The name must
    be changed to the appropriate repo for the container to be pushed.
