#!/usr/bin/env python3

"""
Retrieves HTTP response headers from a URL.
Author: Tales
"""

import requests


def get_http_headers(url):
    try:
        response = requests.get(url)
        return {
            'status_code': response.status_code,
            'headers': dict(response.headers)
        }
    except requests.exceptions.RequestException:
        return None


if __name__ == "__main__":
    import sys
    if len(sys.argv) != 2:
        print("Usage: ./3-http_headers.py <url>")
        sys.exit(1)
    result = get_http_headers(sys.argv[1])
    if result is None:
        print("Error: Could not retrieve headers.")
        sys.exit(1)
    print(f"Status Code: {result['status_code']}")
    print("Headers:")
    for key, value in result['headers'].items():
        print(f"  {key}: {value}")
