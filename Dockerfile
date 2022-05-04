FROM node:17 AS build

WORKDIR /src/

COPY package.json package-lock.json ./

RUN npm ci


FROM klakegg/hugo:0.93.2

COPY --from=build /src/node_modules/ ./node_modules/

COPY . .
