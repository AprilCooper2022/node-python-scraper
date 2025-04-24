FROM python:3.10-slim

# Install Node.js, Chromium, and other dependencies
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    ca-certificates \
    fonts-liberation \
    chromium \
    chromium-driver \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js (use setup script from NodeSource)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Set working directory
WORKDIR /app

# Copy all project files
COPY . .

# Install Python dependencies
RUN pip install -r requirements.txt

# Install Node.js dependencies
RUN npm install

# Environment variable to specify chromium path for puppeteer-core
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

# Run scraper then server using JSON format for CMD
CMD ["sh", "-c", "node scrape.js && python3 server.py"]

