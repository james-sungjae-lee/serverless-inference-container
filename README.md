# serverless-inference-container
aws lambda application for image classification service

```
# Default Setting
sudo yum update -y
sudo yum install docker -y
sudo yum install git -y
git clone https://github.com/odobenuskr/serverless-inference-container.git
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo reboot

# Inference Setting
sudo yum -y groupinstall "Development Tools"
sudo yum -y install openssl-devel bzip2-devel libffi-devel
wget https://www.python.org/ftp/python/3.8.3/Python-3.8.3.tgz
tar xvf Python-3.8.3.tgz
cd Python-3.8*/
./configure --enable-optimizations
sudo make altinstall
sudo yum -y install gcc-c++
sudo yum -y install python3-devel
pip3.8 install tensorflow --user
wget https://raw.githubusercontent.com/kmu-bigdata/architect-cloud/master/sample-application/serverless-inference/save_mobilenet.py
python3.8 save_mobilenet.py
wget https://raw.githubusercontent.com/raghakot/keras-vis/master/resources/imagenet_class_index.json
mv mobilenetv2 ../
mv imagenet_class_index.json ../
cd ../

# Docker Image Setting
sudo service docker start
cd serverless-inference-container
docker build --no-cache -t inference-image .

# AWS ECR Setting
aws configure
export ACCOUNT_ID=$(aws sts get-caller-identity --output text --query Account)
echo "export ACCOUNT_ID=${ACCOUNT_ID}" | tee -a ~/.bash_profile

docker tag inference-image $ACCOUNT_ID.dkr.ecr.us-west-2.amazonaws.com/inference-ecr
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.us-west-2.amazonaws.com
docker push $ACCOUNT_ID.dkr.ecr.us-west-2.amazonaws.com/inference-ecr
```
