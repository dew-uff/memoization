FROM python:3.13

ENV DEBIAN_FRONTEND=noninteractive

# System dependencies (needed for scipy/numpy builds)
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    g++ \
    gfortran \
    libopenblas-dev \
    liblapack-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install Python dependencies
RUN pip install --no-cache-dir \
    matplotlib \
    imageio \
    seaborn \
    numpy \
    cython \
    setuptools \
    lenstronomy==1.13.5 \
    scipy==1.13 \
    mmh3==4.0.1 \
    xxhash==3.4.1 \
    redis==4.3.6 \
    pymongo==4.13.0 \
    pymemcache==4.0.0 \
    mysql-connector-python==9.4.0 \
    cloudpickle==3.1.1

# Installing squirrel
COPY experiments/07_squirrel /tmp/squirrel

RUN pip install -r /tmp/squirrel/requirements.txt && \
    pip install /tmp/squirrel && \
    rm -rf /tmp/squirrel

CMD ["bash"]