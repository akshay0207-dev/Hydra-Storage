# Build Frontend Client
FROM node:20-alpine AS client-builder
WORKDIR /app/client
COPY client/package*.json ./
RUN npm install
COPY client/ ./
RUN npm run build

# Production Server Environment
FROM node:20-alpine
WORKDIR /app
COPY server/package*.json ./server/
RUN cd server && npm install

COPY server/ ./server/
COPY --from=client-builder /app/client/dist ./client/dist

ENV PORT=4000
ENV NODE_ENV=production
EXPOSE 4000

WORKDIR /app/server
CMD ["npm", "start"]
