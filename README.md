# Template:

[![ky0men](https://circleci.com/gh/ky0men/uda-project-4.svg?style=svg)](https://app.circleci.com/pipelines/github/ky0men/uda-project-4/7/workflows/9b7ea653-73f5-4a69-9c7f-60cf514fdb16)

## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API.

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:

- Test your project code using linting
- Complete a Dockerfile to containerize this application
- Deploy your containerized application using Docker and make a prediction
- Improve the log statements in the source code for this application
- Configure Kubernetes and create a Kubernetes cluster
- Deploy a container using Kubernetes and make a prediction
- Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

---

## Setup the Environment

- Install python 3

```bash
#Update package list
sudo apt-get update
#Install Python 3
sudo apt-get install python3
#Verify the installation
python3 --version
#Install pip
sudo apt-get install python3-pip
```

- Create a virtualenv with Python 3.7 and activate it. Refer to this link for help on specifying the Python version in the virtualenv.

```bash
python3 -m pip install --user virtualenv
# You should have Python 3.7 available in your host.
# Check the Python path using `which python3`
# Use a command similar to this one:
python3 -m virtualenv --python=<path-to-Python3.7> .devops
source .devops/bin/activate
```

- Run `make install` to install the necessary dependencies

### Running `app.py`

1. Standalone: `python app.py`
2. Run in Docker: `./run_docker.sh`
3. Run in Kubernetes: `./run_kubernetes.sh`

### Kubernetes Steps

- Setup and Configure Docker locally

  - Install Docker: Go to https://www.docker.com/
    Windows: Download and install Docker Desktop from the official website.
    macOS: Download and install Docker Desktop from the official website.
    Linux: Follow the instructions for your Linux distribution on the official Docker website.
  - Verify the installation:
    ```bash
    docker --version
    ```

- Setup and Configure Kubernetes locally

  - Install minikube: Go to https://minikube.sigs.k8s.io/docs/start/
  - Start minikube:
    ```bash
      minikube start
    ```
  - Verify the installation
    ```bash
      kubectl get node
    ```

- Create Flask app in Container

  - Build the Docker image
    ```bash
      docker build -t my-flask-app .
    ```
  - Run the Docker container
    ```bash
      docker run -p <HOST_PORT>:<CONTAINER_PORT> my-flask-app
    ```

- Run via kubectl
  - Push the Docker image to a container registry:
    ```bash
      docker push <dockerPath>:<tagname>
    ```
  - Create a Kubernetes deployment:
    ```bash
      kubectl create deploy <example-name> --image=<dockerPath> --port=<HOST_PORT>
    ```
  - Check pod is ready running:
    ```bash
      kubectl get pod
    ```
  - Forward port after pod is running:
    ```bash
      kubectl port-forward deployment/<example-name> <HOST_PORT>:<CONTAINER_PORT>
    ```

### File and directory description

| Directory/File         | Description                                                                           |
| ---------------------- | ------------------------------------------------------------------------------------- |
| `.circleci/config.yml` | CircleCI configuration                                                                |
| `Dockerfile`           | Configuration file that can be used to build a Docker Image                           |
| `Makefile`             | configuration file that contains rules for setup evironment, install dependencies.... |
| `model_data`           | Data for train housing prices in Boston                                               |
| `output_txt_files`     | Docker and Kubernetes output log                                                      |
| `app.py`               | API for predicting housing prices in Boston                                           |
| `make_prediction.sh`   | Calls prediction API                                                                  |
| `run_docker.sh`        | Shell script for create and run docker                                                |
| `run_kubernetes.sh`    | Shell script to deploy and forward port kubernetes                                    |
| `upload_docker.sh`     | Shell script for upload image to docker hub repository                                |
| `requirements.txt`     | Requirements dependencies                                                             |
