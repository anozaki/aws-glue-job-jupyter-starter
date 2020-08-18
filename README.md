# Glue Job Dev Environment

This is a Visual Studio Code Remove Development enivornment folder (https://code.visualstudio.com/docs/remote/remote-overview).

To use this repository you will need the follwing installed.

* Visual Studio Code
* Visual Studio Code Remote Development Plugin for Visual Studio Code
* Docker

Thats pretty much it, reset of the tooling will get installed when you open the environment in the remove docker.
You should get a command prompt with all the tools installed (be patient it does take a little bit of time to come up the first time).

If you want to get started right away, simply run the `start_jupyer` from the docker container.
If you are going to use a Glue Dev Endpoint, you will need to ssh to the dev environment (currently this docker setup doesn't generate any ssh key).

`ssh -vnNT -L 8998:169.254.76.1:8998 glue@ec2.compute-1.amazonaws.com`

## Setup 1: AWS Glue Development Endpoint

* Easy to setup
* Work just like running a real AWS Glue Job

## Setup 2: Local execution

* Access to AWS resource is a little bit challenging
* Good for testing execution of Glue/Spark
* Runs locally so no cost.

## Which one should I use?

* Usually work with Setup 2 and switch to Setup 1 after Glue/Spark is figured out.

## TODO

* submit spark job from local environment

## Resources

* https://medium.com/explore-ml/connect-jupyter-notebook-to-aws-glue-endpoint-f5fc78b4e00
* https://support.wharton.upenn.edu/help/glue-debugging
