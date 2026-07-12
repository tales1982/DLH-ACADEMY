#!/usr/bin/env python3

"""
Resolves domain names for IPv4.
Author: Tales
"""

# Import
import socket
import sys


# Funçtions
def resolve_domain_to_ipv4(dns):
    try:
        ip=socket.gethostbyname(dns)
        return ip
    except socket.gaierror:
        return None


# Main Fuctions
def main(dns):
    resolve_domain_to_ipv4(dns)


# Program entry point
if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Pass the domain name as a parameter.")
    else:
        main(sys.argv[1])