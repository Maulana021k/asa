import asyncio
from playwright.async_api import async_playwright
import os

async def main():
    html_path = os.path.abspath("index24.html")
    url = "file://" + html_path

    async with async_playwright() as p:
        # Ganti ke Firefox
        browser = await p.firefox.launch(headless=True)  # set headless=False kalau mau lihat UI
        context = await browser.new_context()
        page = await context.new_page()

        # Dengarkan console lebih awal agar log awal tidak terlewat
        page.on("console", lambda msg: print(f"[console:{msg.type}] {msg.text}"))

        print(f"[*] Membuka {url}")
        await page.goto(url, wait_until="load")

        # Biarkan terbuka (contoh: 1 jam). Ubah sesuai kebutuhan.
        await page.wait_for_timeout(60 * 60 * 1000)

        await browser.close()

asyncio.run(main())
