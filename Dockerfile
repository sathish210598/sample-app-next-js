# Use Node.js on Windows Server Core
FROM mcr.microsoft.com/windows/servercore:ltsc2022

# Set environment variables
ENV NODE_VERSION=20.12.2

# Install Node.js (using PowerShell)
RUN powershell -Command " `
    Invoke-WebRequest https://nodejs.org/dist/v%NODE_VERSION%/node-v%NODE_VERSION%-x64.msi -OutFile nodejs.msi ; `
    Start-Process msiexec.exe -ArgumentList '/quiet', '/qn', '/i', 'nodejs.msi' -NoNewWindow -Wait ; `
    Remove-Item -Force nodejs.msi"

# Set working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy remaining app files
COPY . .

# Expose app port (change if needed)
EXPOSE 3000

# Run the app (change `app.js` to your entry point)
CMD ["node", "app.js"]
