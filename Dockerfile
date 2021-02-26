FROM jupyter/all-spark-notebook:4186bd15e139

#Thanks to https://github.com/dzanaga/eojupy/blob/master/Dockerfile
USER root

RUN apt-get update && \
    apt-get install -y gdal-bin

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
    apache-sedona



