FROM artifactory.corp.olacabs.com:5000/ola-python:3.9.9

RUN apt-get update && \
  apt-get install -y --no-install-recommends  \
  build-essential software-properties-common  \
  tar unzip vim wget python python-dev python-distribute python-pip && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip

RUN mkdir /app

WORKDIR /app

EXPOSE 8980

# By copying over requirements first, we make sure that Docker will cache
# our installed requirements rather than reinstall them on every build

COPY requirements.txt /app/requirements.txt

#RUN pip --no-cache-dir install -r requirements.txt

RUN pip install -r requirements.txt

#COPY scripts/start*.sh /
# copy entrypoint.sh
# Now copy in our code, and run it
#RUN pip --no-cache-dir install --upgrade awscli

COPY src /app/
CMD ["bash","main.sh"]

