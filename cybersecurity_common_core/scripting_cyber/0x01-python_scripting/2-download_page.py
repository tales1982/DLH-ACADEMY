#!/usr/bin/env python3

"""
Downloads and formats HTML content from a URL.
Author: Tales
"""

import requests
from bs4 import BeautifulSoup


def download_page(url):
    try:
        response = requests.get(url)
        s = BeautifulSoup(response.text, 'html.parser')
        return s.prettify()
    except requests.exceptions.RequestException as e:
        return f"Error downloading page: {e}"


if __name__ == "__main__":
    import sys
    if len(sys.argv) != 2:
        print("Usage: ./2-download_page.py <url>")
        sys.exit(1)
    print(download_page(sys.argv[1]))
