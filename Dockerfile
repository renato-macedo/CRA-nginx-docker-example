FROM node:12-stretch AS project
WORKDIR /project
COPY package-lock.json package.json ./
RUN npm ci
COPY . .

RUN npm run build

FROM nginx:1.17

COPY --from=project ./project/build /usr/share/nginx/html

