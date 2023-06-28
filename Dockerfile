# Use Python 3.8 as the base image
FROM python:3.9

# Set the working directory inside the container
WORKDIR /app

# By copying over requirements first, we make sure that Docker will cache
# our installed requirements rather than reinstall them on every build

COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt



# Copy the application code to the working directory
COPY . .

EXPOSE 8980

CMD ["bash","main.sh"]

