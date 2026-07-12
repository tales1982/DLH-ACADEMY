#!/usr/bin/env python3

"""
Recursively crawls a website and discovers internal links up to a given depth.
Author: Tales
"""

import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin, urlparse


def crawl_website(start_url, max_depth=2):
    visited = set()
    base_domain = urlparse(start_url).netloc

    def crawl(url, depth):
        if depth == 0 or url in visited:
            return
        try:
            response = requests.get(url, timeout=5)
            print(f"Crawling: {url}")
            visited.add(url)
            soup = BeautifulSoup(response.text, 'html.parser')
            for tag in soup.find_all('a', href=True):
                link = urljoin(url, tag['href'])
                if urlparse(link).netloc == base_domain and link not in visited:
                    crawl(link, depth - 1)
        except Exception:
            pass

    crawl(start_url, max_depth)
    return visited


if __name__ == "__main__":
    import sys
    if len(sys.argv) < 2:
        print("Usage: ./4-web_crawler.py <url> [max_depth]")
        sys.exit(1)
    url = sys.argv[1]
    depth = int(sys.argv[2]) if len(sys.argv) == 3 else 2
    result = crawl_website(url, depth)
    print(f"\nTotal pages crawled: {len(result)}")
