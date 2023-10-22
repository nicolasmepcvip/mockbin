FROM node:18-alpine

# Create app directory
WORKDIR /mockbin

# Install app dependencies
COPY package*.json ./
RUN npm ci --only=production

# Bundle app source
COPY . .

# Set environment variable for Redis
ENV MOCKBIN_REDIS "redis://redis:6379"

# Expose port
EXPOSE 80

# Start command
CMD ["npm", "start"]
