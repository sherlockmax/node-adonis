FROM ubuntu

ARG NODE_VER=v11.1.0

RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install curl -y
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash && source /root/.nvm/nvm.sh && source ~/.bashrc && nvm install ${NODE_VER} && npm i -g @adonisjs/cli

WORKDIR /project

ENV PATH "${PATH}:/root/.nvm/versions/node/${NODE_VER}/bin"
ENV PATH "${PATH}:/root/.nvm/versions/node/${NODE_VER}/bin/npm"

EXPOSE 80

CMD ["/bin/bash"]