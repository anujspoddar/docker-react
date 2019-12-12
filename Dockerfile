FROM node:alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
CMD ["npm","run","build"]

# The 2nd FROM means the 1st image part has been completed 
FROM nginx 
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

