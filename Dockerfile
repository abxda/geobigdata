FROM jupyter/all-spark-notebook:4186bd15e139

#Thanks to https://github.com/dzanaga/eojupy/blob/master/Dockerfile
USER root

RUN apt-get update && \
    apt-get install -y gdal-bin

RUN apt-get update && \
    apt-get install -y --no-install-recommends git && \
    apt-get clean

RUN apt-get update && apt-get -y install cmake protobuf-compiler

RUN apt-get update && apt-get install -y \
	libopencv-dev \
	python3-opencv && \
    rm -rf /var/lib/apt/lists/*

USER jovyan

RUN pip install tqdm \
    psycopg2-binary sqlalchemy && \
    conda install -y gdal && \
    conda install -y -c conda-forge opencv

RUN pip install --no-cache-dir \
    html2text \
    psycopg2-binary \
    newspaper3k==0.2.8 \
    altair \
    vega_datasets \
    geopandas \
    attrs \
    apache-sedona \
    xlsxwriter \
    openpyxl

RUN git clone --recursive https://github.com/dmlc/xgboost && \
    cd xgboost && \
    make -j4 && \
    cd python-package; python setup.py install

RUN pip install tensorflow && \
    pip install pyyaml \
        h5py && \
    pip install keras --no-deps && \
    pip install opencv-python && \
    pip install imutils