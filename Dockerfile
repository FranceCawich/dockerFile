
FROM nvidia/cuda:10.2-cudnn7-devel-ubuntu18.04 as base
LABEL opensciencegrid.name="TensorFlow GPU"
LABEL opensciencegrid.description="TensorFlow image with GPU support"
LABEL opensciencegrid.url="https://www.tensorflow.org/"
LABEL opensciencegrid.category="Tools"

# Install lower level dependencies
RUN export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true && \
    apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        python \
        python3 \
        python3-markdown \
        python3-pip \
        python-markdown \
        python-numpy \
        python-pip \
        git \
         wget \
        && \
    apt-get clean
##RUN pip install tensorflow-gpu==1.15

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get install -y --allow-unauthenticated \
        libnvinfer6=6.0.1-1+cuda10.2 \
        libnvinfer-dev=6.0.1-1+cuda10.2 \
        libnvinfer-plugin6=6.0.1-1+cuda10.2

RUN echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" >/etc/apt/sources.list.d/bazel.list && \
    curl https://bazel.build/bazel-release.pub.gpg | apt-key add -

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y --allow-unauthenticated \
        bazel
RUN python3 -m pip install --upgrade pip && \
    python3 -m pip install --upgrade setuptools

RUN python3 -m pip --no-cache-dir install \
        h5py \
        ipykernel \
        jupyter \
        matplotlib \
        numpy \
        pandas \
        Pillow \
        scipy \
        sklearn \
        && \
    python3 -m ipykernel.kernelspec   



# Install TensorFlow GPU version.
RUN python3 -m pip install --upgrade tensorflow==2.3 keras
WORKDIR /code
