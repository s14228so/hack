Last login: Wed Feb 27 15:47:11 on ttys001
You have mail.
MacBook-Pro-7:nuxt satoshi$ cd
MacBook-Pro-7:~ satoshi$ cd rails-nuxt-tutorial/
MacBook-Pro-7:rails-nuxt-tutorial satoshi$ ls
README.md          docker-compose.yml nuxt               rails
MacBook-Pro-7:rails-nuxt-tutorial satoshi$ cd nuxt
MacBook-Pro-7:nuxt satoshi$ vi Dockerfile 
FROM node:9
  
RUN mkdir -p /nuxt
COPY . /nuxt
WORKDIR /nuxt

RUN npm uninstall -g yarn && \
    npm install -g yarn && \
    chmod u+x /usr/local/bin/yarn && \
    yarn global add nuxt && \
    : 'yarn global add vue-cli create-nuxt-app' && \
    yarn install && \
    yarn build

ENV HOST 0.0.0.0
EXPOSE 8080
CMD ["yarn", "start"]
~                                                                               
~                                                                               
~                                                                               
~                                                                               
~                                                                               
~                                                                               
"Dockerfile" [noeol] 17L, 334C

