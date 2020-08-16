# https://support.wharton.upenn.edu/help/glue-debugging

FROM ubuntu:18.04

RUN apt-get update \
 && apt-get install -y software-properties-common \
 && apt-add-repository -y ppa:webupd8team/java

RUN apt-get update \
 && apt-get upgrade -y

RUN apt-get update \
 && apt-get install -y zip unzip git python3 python3-pip krb5-multidev
RUN pip3 install -U botocore awscli pylint autopep8 jupyter notebook sparkmagic


# setup python3 and pip3 to be default and add display profile info to cmd prompt.
RUN echo 'alias python="/usr/bin/python3"' >> /root/.bashrc \
 && echo 'alias pip="/usr/bin/pip3"' >> /root/.bashrc \
 && echo 'export PS1="(\$AWS_PROFILE) $PS1"' >> /root/.bashrc

RUN jupyter nbextension enable --py widgetsnbextension --sys-prefix

RUN cd /usr/local/lib/python3.6/dist-packages/ \
 && jupyter-kernelspec install sparkmagic/kernels/sparkkernel \
 && jupyter-kernelspec install sparkmagic/kernels/pysparkkernel

COPY .devcontainer/sparkconfig.json /root/.sparkmagic/sparkconfig.json

RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections \
 && add-apt-repository ppa:ts.sch.gr/ppa \
 && apt-get update \
 && apt-get install -y oracle-java8-installer --allow-unauthenticated
ENV JAVA_HOME="/usr/lib/jvm/java-8-oracle"

RUN cd /opt \
 && wget http://mirrors.ibiblio.org/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz \
 && tar xzvf apache-maven-3.6.3-bin.tar.gz \
 && rm apache-maven-3.6.3-bin.tar.gz 
ENV PATH="/opt/apache-maven-3.6.3/bin:$PATH"

RUN pip3 install notebook

# Spark install and configuration
RUN cd /opt \
 && wget https://aws-glue-etl-artifacts.s3.amazonaws.com/glue-1.0/spark-2.4.3-bin-hadoop2.8.tgz \
 && tar xvf spark-2.4.3-bin-hadoop2.8.tgz \
 && rm spark-2.4.3-bin-hadoop2.8.tgz
ENV SPARK_HOME="/opt/spark-2.4.3-bin-spark-2.4.3-bin-hadoop2.8"
ENV SPARK_CONF_DIR=/opt/aws-glue-libs/conf
ENV PYTHONPATH="${SPARK_HOME}/python/:${SPARK_HOME}/python/lib/py4j-0.10.7-src.zip:/opt/aws-glue-libs/PyGlue.zip:${PYTHONPATH}"
ENV PATH="$SPARK_HOME/bin:$PATH"

# Local glue install and configuration
RUN cd /opt \
 && git clone --single-branch --branch glue-1.0 https://github.com/awslabs/aws-glue-libs.git \
 && cd aws-glue-libs \
 && chmod +x ./bin/glue-setup.sh \
 && ./bin/glue-setup.sh

RUN pip3 install -U botocore awscli pylint autopep8 

# setup python3 and pip3 to be default and add display profile info to cmd prompt.
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.6 10 \
 && update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 10 
