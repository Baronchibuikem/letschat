
# The first instruction is what image we want to base our container on
# We Use an official Python runtime as a parent image
FROM python

# The enviroment variable ensures that the python output is set straight
# to the terminal with out buffering it first
ENV PYTHONUNBUFFERED 1

#PYTHONDONTWRITEBYTECODE: Prevents Python from writing pyc files to disc (equivalent to python -B)
ENV PYTHONDONTWRITEBYTECODE 1

# create root directory for our project in the container
RUN mkdir /app

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app/

RUN pip install wheel
# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

EXPOSE 8000