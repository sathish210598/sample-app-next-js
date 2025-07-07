# ✅ Use valid Windows container image for Node.js 20
FROM node:20-windowsservercore-ltsc2022

# Set working directory
WORKDIR /app

# Copy and install dependencies
COPY package*.json ./
RUN npm install

# Copy source code
COPY . .

# Expose application port (e.g., 3000 for Express)
EXPOSE 3000

# Start your app
CMD ["node", "app.js"]
