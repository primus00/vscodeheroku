FROM alpine:latest

# Install python and pip
RUN apk add --no-cache --update nodejs npm bash
# ADD ./webapp/requirements.txt /tmp/requirements.txt

RUN npm install code-server
# # Install dependencies
# RUN pip3 install --no-cache-dir -q -r /tmp/requirements.txt

# # Add our code
# ADD ./webapp /opt/webapp/
# WORKDIR /opt/webapp

# Expose is NOT supported by Heroku
# EXPOSE 5000 		

# Run the image as a non-root user
RUN adduser -D myuser
USER myuser


# Run the app.  CMD is required to run on Heroku
# $PORT is set by Heroku


CMD code-server 0.0.0.0:$PORT
