# Holberton School - Passive Recon Report

**Domain:** holbertonschool.com  
**Method:** Passive reconnaissance using Shodan  
**Note:** holbertonschool.com redirects to hbtn.dev

---

## Subdomains Found

I searched for subdomains using Shodan with the query `ssl:"holbertonschool.com"` and found the following active subdomains:

- apply.holbertonschool.com
- read.holbertonschool.com
- yriry2.holbertonschool.com

---

## IP Addresses

After looking up the subdomains on Shodan, these are the IPs associated with each:

| Subdomain | IP |
|---|---|
| apply.holbertonschool.com | 13.38.201.141 |
| read.holbertonschool.com | 35.181.124.46 |
| yriry2.holbertonschool.com | 52.47.143.83 |

## IP Ranges

All three IPs belong to Amazon AWS in the eu-west-3 region (Paris, France). I checked the reverse DNS of each IP and confirmed this:

- 13.38.201.141 → ec2-13-38-201-141.eu-west-3.compute.amazonaws.com
- 35.181.124.46 → ec2-35-181-124-46.eu-west-3.compute.amazonaws.com
- 52.47.143.83 → ec2-52-47-143-83.eu-west-3.compute.amazonaws.com

IP ranges (CIDR) for AWS eu-west-3 that contain these addresses:

- 13.38.0.0/15
- 35.180.0.0/14
- 52.47.0.0/16

---

## Technologies and Frameworks

Looking at the Shodan results for each host, here is what I found:

**Web Server:**
- nginx 1.20.0 (visible in the `Server:` header on HTTP responses)

**Hosting:**
- Amazon AWS EC2, region eu-west-3 (Paris)

**SSL/TLS:**
- TLSv1.2 on all subdomains
- Let's Encrypt certificate on apply.holbertonschool.com
- Amazon RSA 2048 certificate on read.holbertonschool.com

**Security Headers found:**
- X-Frame-Options
- X-XSS-Protection
- X-Content-Type-Options

---

## HTTP Responses

**apply.holbertonschool.com** returned HTTP 200, so the page is public and accessible.

**read.holbertonschool.com** returned HTTP 401 Unauthorized, which means you need to login to access it.

---

## Notes and Observations

- All infrastructure is on AWS Paris, which makes sense since Holberton has campuses in France.
- nginx 1.20.0 is the web server used everywhere.
- The main domain holbertonschool.com redirects to hbtn.dev.
- Some subdomains like read.holbertonschool.com are protected with authentication.
- SSL is properly configured with TLSv1.2, no old versions like TLS 1.0 or 1.1.
- Basic security headers are present which is good practice.

---

## Tools Used

- Shodan (shodan.io)
