const puppeteer = require('puppeteer-core');
const fs = require('fs');

const scrapeUrl = process.env.SCRAPE_URL || 'https://www.agoda.com';

(async () => {
  const browser = await puppeteer.launch({
    executablePath: '/usr/bin/chromium',
    headless: true,
    args: ['--no-sandbox', '--disable-setuid-sandbox']
  });

  const page = await browser.newPage();
  await page.goto(scrapeUrl, { waitUntil: 'networkidle2' });

  const title = await page.title();

  let heading = '';
  try {
    heading = await page.$eval('title', el => el.innerText);
  } catch {
    heading = 'Heading not found';
  }

  const result = { title, heading };
  fs.writeFileSync('scraped_data.json', JSON.stringify(result));

  await browser.close();
})();
