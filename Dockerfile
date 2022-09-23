FROM node:13.12.0-alpine

WORKDIR /app

COPY package.json ./
COPY package-lock.json ./

RUN npm install

RUN npm install -g nodemon

COPY . .

EXPOSE 8080

CMD ["npm", "start"]

# FROM jenkins/jenkins:2.361.1-jdk11
# USER root
# RUN apt-get update && apt-get install -y lsb-release
# RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
#   https://download.docker.com/linux/debian/gpg
# RUN echo "deb [arch=$(dpkg --print-architecture) \
#   signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
#   https://download.docker.com/linux/debian \
#   $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
# RUN apt-get update && apt-get install -y docker-ce-cli
# USER jenkins
# RUN jenkins-plugin-cli --plugins "blueocean:1.25.8 docker-workflow:521.v1a_a_dd2073b_2e"

# docker run --name jenkins-blueocean --restart=on-failure --detach ^
#   --network jenkins --env DOCKER_HOST=tcp://localhost:2375 ^
#   --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 ^
#   --volume jenkins-data:/var/jenkins_home ^
#   --volume jenkins-docker-certs:/certs/client:ro ^
#   --publish 8080:8080 --publish 50000:50000 myjenkins-blueocean:2.361.1-1