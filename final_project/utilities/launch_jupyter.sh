#! /usr/bin/env bash
export PYTHONPATH="/home/hadoop/.local/lib/python3.6/site-packages:$PYTHONPATH"
export PYSPARK_DRIVER_PYTHON=/home/hadoop/.local/bin/jupyter
export PYSPARK_DRIVER_PYTHON_OPTS='notebook --no-browser'
export PYSPARK_PYTHON=/usr/bin/python3
echo $PYTHONPATH
echo $PYSPARK_DRIVER_PYTHON
echo $PYSPARK_DRIVER_PYTHON_OPTS
pyspark
