# Udacity Cloud DevOps Engineer Project 4:
[![CircleCI](https://circleci.com/gh/xuanduy0501/udacity_project4.svg?style=svg)](https://github.com/xuanduy0501/udacity_project4)
## `Project summary`

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API.

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

# `Project Task`

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

---

# `Setup the Environment`

 Install python 3
| Command        | Remark |
| ---------------------- | ------------------------------------------------------------------------------------- |
| sudo apt-get update    | Update package |
| sudo apt-get install python3   | Install Python 3 |
| sudo apt-get install python3-pip    |  Install pip |
| python3 --version    | Verify the installation |
| python3 -m pip install --user virtualenv   | Create a virtualenv |
| source .devops/bin/activate | Active a virtualenv |

- Run `make install` to install the necessary dependencies

### Running `app.py`

1. Standalone: `python app.py`
2. Run in Docker: `./run_docker.sh`
3. Run in Kubernetes: `./run_kubernetes.sh`

### Kubernetes Steps

Setup and Configure Docker locally
- Verify the installation: docker --version
- Setup and Configure Kubernetes locally
  - Start minikube: minikube start
  - Verify the installation: kubectl get node
- Create Flask app in Container
  - Build the Docker image: docker build -t my-flask-app .
  - Run the Docker container: docker run -p <HOST_PORT>:<CONTAINER_PORT> my-flask-app
Run via kubectl
# `Files and directories explanation`

| Directories/Files        | Explanation |
| ---------------------- | ------------------------------------------------------------------------------------- |
| .circleci/config.yml | CircleCI configuration    |
| Dockerfile           | Build a Docker Image    |
| Makefile             | Setup evironment, install dependencies.... |
| model_data           | Data for train housing prices in Boston  |
| output_txt_files     | Docker and Kubernetes output log   |
| run_kubernetes.sh    | Shell script to deploy and forward port kubernetes   |
| upload_docker.sh     | Shell script for upload image to docker hub repository   |
| make_prediction.sh   | Calls prediction API     |
| run_docker.sh        | Shell script for create and run docker  |
| app.py               | API for predicting housing prices in Boston   |
| requirements.txt     | Requirements dependencies   |