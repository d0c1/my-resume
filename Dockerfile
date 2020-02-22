FROM node:13-slim
USER node

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
WORKDIR /usr/src/app

COPY package.json ./
COPY package-lock.json ./
COPY resume.json ./

RUN npm install -g resume-cli jsonresume-theme-stackoverflow
ENV PATH="/home/node/.npm-global/bin:${PATH}"
CMD ["/home/node/.npm-global/bin/resume", "serve", "resume.pdf" "--format", "pdf", "--theme", "stackoverflow"]

