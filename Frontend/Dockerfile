# ---- dev: Vite dev server with hot reload (used by docker-compose.yml) ----
FROM node:20-alpine AS dev
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
EXPOSE 5173
CMD ["npm", "run", "dev", "--", "--host"]

# ---- build: compile the production bundle ----
FROM dev AS build
# Empty = call the API on the same origin; nginx proxies /api to the backend.
ARG VITE_API_URL=""
ENV VITE_API_URL=${VITE_API_URL}
RUN npm run build

# ---- prod: static files served by nginx (used by docker-compose.prod.yml) ----
FROM nginx:1.27-alpine AS prod
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
