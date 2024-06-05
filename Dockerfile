# Use an official Node.js runtime as a parent image
FROM node:latest

# Set the working directory inside the container
WORKDIR /app

# Update npm to version 9 globally
RUN npm install npm@9 -g

# Clone the Uptime Kuma repository
RUN git clone https://github.com/louislam/uptime-kuma.git .

# Change to the repository directory
WORKDIR /app/uptime-kuma

# Install dependencies and set up the application
RUN npm run setup

# Expose the port the app runs on
EXPOSE 3001

# Command to run the application
CMD ["node", "server/server.js"]
