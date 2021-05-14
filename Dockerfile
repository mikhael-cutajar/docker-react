# FROM node:alpine

# USER node

# RUN mkdir -p /home/node/app
# WORKDIR /home/node/app

# COPY --chown=node:node ./package.json ./
# RUN npm install
# COPY --chown=node:node ./ ./

# CMD ["npm", "run", "build"]

FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html