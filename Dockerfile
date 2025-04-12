FROM node AS build
WORKDIR /Jaydeep
COPY . .
RUN npm install
RUN npm run build

FROM nginx
COPY --from=build /Jaydeep/build/. /usr/share/nginx/html