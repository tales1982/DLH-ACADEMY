# 0x05 — Upload Vulnerabilities

Module covering file upload vulnerabilities — one of the most dangerous vulnerability classes in web applications. Covers techniques to bypass upload filters and achieve Remote Code Execution (RCE) through malicious file uploads.

---

## Contents

| File | Description |
|------|-------------|
| `0-target.txt` | Target application URL and initial recon notes |
| `1-flag.txt` through `4-flag.txt` | CTF flags extracted during the challenges |
| `bigpayload.php` | Large PHP webshell payload |
| `flag1.php` | PHP script used to retrieve the first flag |
| `flag2.php%00.png` | Null byte injection bypass — disguises a PHP file as a PNG |
| `gifpayload.php` | PHP webshell embedded in a GIF-formatted file |
| `payload.php%00.png` | Null byte bypass payload |
| `pngpayload.php` | PHP webshell with PNG magic bytes header |
| `pngpayload.png.php` | Double extension bypass — triggers PHP execution despite `.png` in the name |
| `task4.php` | PHP payload for task 4 |
| `tales.jpeg` | Legitimate image file used in testing |
| `test.gif` / `test.jpg` / `test.png` | Test image files used during challenges |
| `Upload_Vulnerability_Wordlist.txt` | Wordlist of upload-related paths and filenames for fuzzing |

---

## Bypass Techniques Covered

| Technique | Description |
|-----------|-------------|
| **Extension filtering bypass** | Uploading `.php5`, `.phtml`, `.phar` when `.php` is blocked |
| **Double extension** | `shell.png.php` — web server executes as PHP |
| **Null byte injection** | `shell.php%00.png` — application sees `.png`, server executes `.php` |
| **Magic bytes spoofing** | Prepend `GIF89a` or PNG magic bytes to a PHP payload to pass content-type checks |
| **MIME type manipulation** | Change `Content-Type` header to `image/jpeg` for a PHP file |
| **Content-Type bypass via Burp Suite** | Intercept the upload request and modify headers on the fly |

---

## Skills Practiced

- Identifying insecure file upload endpoints
- Crafting payloads that bypass client-side and server-side upload filters
- Achieving Remote Code Execution (RCE) through uploaded web shells
- Using Burp Suite to intercept and modify upload requests
- Understanding why upload validation must happen server-side

---

## Tools

- **Burp Suite** — intercept and modify upload requests
- **curl** — send crafted file upload requests from the command line
- **file** — inspect file magic bytes

---

## References

- [OWASP — Unrestricted File Upload](https://owasp.org/www-community/vulnerabilities/Unrestricted_File_Upload)
- [PortSwigger — File Upload Vulnerabilities](https://portswigger.net/web-security/file-upload)
