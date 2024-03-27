# Use the official Node.js 14 image as a parent image
FROM node:14

# Set the working directory inside the container to /app
WORKDIR /app

# Copy package.json and package-lock.json files into the container at /app
COPY . .

# Install dependencies in the container
RUN npm install

# Expose the port the app runs on
EXPOSE 8081

# Define the command to run your app using CMD which defines your runtime
CMD [ "npm", "start" ]
