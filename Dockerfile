FROM osgeo/gdal:ubuntu-small-latest

FROM jupyter/all-spark-notebook:4186bd15e139

RUN pip install --no-cache-dir \
    html2text \
    psycopg2-binary \
    newspaper3k==0.2.8 \
    altair \
    vega_datasets \
    geopandas \
    attrs \
    apache-sedona
