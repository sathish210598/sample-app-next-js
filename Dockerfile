# Use official Node.js image for Windows
FROM node:20.12.2-windowsservercore-ltsc2022

# Set working directory
WORKDIR /app

# Copy and install dependencies
COPY package*.json ./
RUN npm install

# Copy app files
COPY . .

# Expose the app port (adjust if needed)
EXPOSE 3000

# Start the app (adjust app.js if needed)
CMD ["node", "app.js"]
