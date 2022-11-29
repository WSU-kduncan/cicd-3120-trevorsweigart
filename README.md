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

# Deployment

- The container restart script is a script to verify that the container we want to run does not
    already exist and is not already running. In order to make sure of that, the script tries to
    find our container by calling stop on it, then removing the files and deleting the container.
    The container that the script pulls initially is then run.

- The listener was created by telling the file to listen for any github action then doing
    something. For instance, if it detects that there is a push on the main branch then GitHub
    will run the commands in the file.

- To install the WebHook on GitHub, Docker credentials need to be defined as secrets.
    In this case, your Docker username and token need to be stored as a GitHub secret.
    These are then used throughout the workflow so the runner can access your DockerHub repo.
    Then in the 'Actions' section in GitHub, the workflow file can be defined by creating
    your own workflow then pasting the appropriate contents. Then a webhook needs created
    in GitHub. This is done by installing the webhook package in the project repo. When
    the webhook is run it will show the appropriate link that can be given to Dockerhub.

- To keep the webhook running while the instance is on the webhook command can be placed
    in the system .bash_profile. This will run the command when the system is booted.
    Just place the webhook command `webhook -hooks webhook.json -verbose` in .bash_profile.
    This will automatically run the webhook whenever the system is running.

- The webhook task definition file creates the parameters of the link for the webhook.
    This means defining the hook id, the start script, as well as defining a personal key
    for authentication.

- To setup a notifier in GitHub a webhook can be used. Since webhooks can run off of GitHub actions
    (such as pushing), a webhook can be made that every time a certain GitHub action is done
    an email can be sent to the repo owner.
