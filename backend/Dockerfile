FROM node:18-alpine

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install production dependencies only
RUN npm ci --omit=dev

# Copy source code
COPY . .

# Expose backend port
EXPOSE 5000

# Start the server
CMD ["node", "index.js"]
