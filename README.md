**📌 Node + Python Web Scraper (Agoda Example)**
This project scrapes a target webpage and serves extracted data via a Flask web server, all containerized using Docker.

🔧 **Tech Stack**

Node.js + Puppeteer (Scraper)
Python + Flask (Web server)
Docker (Containerization)

## 🐳 Build the Docker Image

```bash
docker build -t node-python-scraper .
```

## 🚀 Run the Container

```bash
docker run -e SCRAPE_URL="https://www.agoda.com" -p 5000:5000 node-python-scraper
```

## 🌐 Access the Result

Visit http://localhost:5000 (or your EC2 public IP if deployed).

You’ll see the scraped page title and heading from Agoda.com as JSON.

🧪 Output
