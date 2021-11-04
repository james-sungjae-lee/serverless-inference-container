FROM amazon/aws-lambda-python:3.8

# add moddel file from local directory
COPY mobilenetv2 /var/task/mobilenetv2
COPY imagenet_class_index.json /var/task/

# optional : ensure that pip is up to data
RUN /var/lang/bin/python3.8 -m pip install --upgrade pip

# install git 
RUN yum install git -y

# git clone
RUN git clone https://github.com/odobenuskr/serverless-inference-container.git

# install packages
RUN pip install -r profet-docker/requirements.txt

# move lambdafunc.py
RUN cp profet-docker/lambda_function.py /var/task/

CMD ["lambda_function.handler"]
