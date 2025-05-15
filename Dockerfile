# Use Node base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy files
COPY . .

# Install dependencies
RUN npm install

# Build (optional for React)
# RUN npm run build

# Start the app
CMD ["npm", "start"]

# Expose port
EXPOSE 3000
