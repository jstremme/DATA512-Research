# in terminal

wget https://repo.continuum.io/archive/Anaconda3-2019.10-Linux-x86_64.sh
sh Anaconda3-2019.10-Linux-x86_64.sh

conda create -n py368 python=3.6.8
source activate py368
python -m ipykernel install --user --name py368 --display-name "Python 3.6.8"



unset PYTHONPATH
pip uninstall -y enum34


export PYSPARK_DRIVER_PYTHON=jupyter
export PYSPARK_PYTHON=/home/hadoop/anaconda3


import os

# Make sure you call it before importing pyspark
import findspark
findspark.init()

# Defining the python version to use on the workers
os.environ['PYSPARK_PYTHON'] = '/home/hadoop/anaconda3'

# Pyspark imports
import pyspark
from pyspark.sql import SparkSession

# For pi test
import random

spark = SparkSession.builder.master('spark://localhost:7077').appName('spark-cluster').getOrCreate()

NUM_SAMPLES = 10

def inside(p):
    x, y = random.random(), random.random()
    return x*x + y*y < 1

count = spark.sparkContext.parallelize(range(0, NUM_SAMPLES)) \
             .filter(inside).count()

print('Pi is roughly {}'.format(4.0 * count / NUM_SAMPLES))