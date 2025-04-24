# Node + Python Scraper (Agoda Example)

## 🐳 Build the Docker Image

```bash
docker build -t node-python-scraper .
```

## 🚀 Run the Container

```bash
docker run -e SCRAPE_URL="https://www.agoda.com" -p 5000:5000 node-python-scraper
```

## 🌐 Access the Result

Visit: http://<your-ec2-public-ip>:5000

You’ll see the scraped page title and heading from Agoda.com as JSON.
