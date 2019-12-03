# Update package manager
sudo yum update

# Install Anaconda
wget https://repo.continuum.io/archive/Anaconda3-2019.10-Linux-x86_64.sh
sh Anaconda3-2019.10-Linux-x86_64.sh

# Create virtual environment
conda create -n py368 python=3.6.8
source activate py368

# Install Python packages
pip install --user jupyter
pip install --user ipython
pip install --user ipykernel
pip install --user numpy
pip install --user pandas
pip install --user matplotlib
pip install --user scikit-learn

# Create notebook kernel
python -m ipykernel install --user --name py368 --display-name "Python 3.6.8"

# Pull repo
sudo yum install git
git clone https://github.com/jstremme/DATA512-Research.git

# PYSPARK Configuration
export PYTHONPATH="/home/hadoop/.local/lib/python3.6/site-packages:$PYTHONPATH"
export PYSPARK_DRIVER_PYTHON=/home/hadoop/.local/bin/jupyter
export PYSPARK_DRIVER_PYTHON_OPTS='notebook --no-browser'
export PYSPARK_PYTHON=/usr/bin/python3
echo $PYTHONPATH
echo $PYSPARK_DRIVER_PYTHON
echo $PYSPARK_DRIVER_PYTHON_OPTS
pyspark
