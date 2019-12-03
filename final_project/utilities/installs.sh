pip install --upgrade pip

pip install --user jupyter
pip install --user ipython
pip install --user numpy
pip install --user pandas
pip install --user matplotlib
pip install --user scikit-learn




sudo sed -i -e '$a\export PYSPARK_PYTHON=/usr/bin/python3' /etc/spark/conf/spark-env.sh



# sudo yum update -y 
# sudo yum install python36

# pip uninstall pyzmq
# pip install pyzmq

sudo python3 -m pip install ipykernel
sudo python3 -m ipykernel install

pip uninstall -y enum34



sudo install git -y
git clone https://github.com/jstremme/DATA512-Research.git