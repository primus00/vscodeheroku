FROM ubuntu

RUN apt-get update 
RUN apt-get install -y curl dpkg
RUN curl -fOL https://github.com/cdr/code-server/releases/download/v3.4.1/code-server_3.4.1_amd64.deb
RUN dpkg -i code-server_3.4.1_amd64.deb

# RUN systemctl --user enable --now code-server

# Install python and pip
RUN apk add --no-cache --update nodejs npm bash
# ADD ./webapp/requirements.txt /tmp/requirements.txt
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
