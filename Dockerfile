FROM jupyter/all-spark-notebook:4186bd15e139

USER root

RUN apt install -y gdal-bin python-gdal python3-gdal

RUN pip install --no-cache-dir \
    html2text \
    psycopg2-binary \
    newspaper3k==0.2.8 \
    altair \
    vega_datasets \
    geopandas \
    attrs \
    apache-sedona
