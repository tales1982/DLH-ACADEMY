# 1. The Symmetric Engine — MedDefense Health Systems

**Analyst:** Security Analyst
**Date:** Current
**Environment:** OpenSSL 3.0.13, Ubuntu 24.04

*All commands and outputs below were actually executed, not reconstructed from memory — including a real limitation discovered along the way (Part 1, AES-256-GCM).*

## Part 1: AES Encryption and Decryption

**Test file** (`patient_record.txt`, 85 bytes):
```
Patient: Jane Doe | DOB: 1985-03-14 | MRN: MED-50421 | Diagnosis: Atrial Fibrillation
```

### AES-256-CBC

```
openssl enc -aes-256-cbc -pbkdf2 -salt -in patient_record.txt \
  -out patient_record_cbc256.enc -pass pass:MedDefenseLab2026
```
Output file: 112 bytes (85-byte plaintext padded to a 16-byte CBC block boundary, plus the 16-byte `Salted__` header OpenSSL prepends). Decryption verified byte-for-byte identical to the original via `diff`.

### AES-256-GCM — a real, worth-documenting limitation

```
openssl enc -aes-256-gcm -pbkdf2 -salt -in patient_record.txt \
  -out patient_record_gcm256.enc -pass pass:MedDefenseLab2026
```
**Actual output:**
```
enc: AEAD ciphers not supported
enc: Use -help for summary.
```
This is not a mistake in the command — `openssl enc` genuinely does not support GCM or any other AEAD (Authenticated Encryption with Associated Data) cipher, even though `openssl list -cipher-algorithms` confirms `aes-256-gcm` is a registered, available cipher in this OpenSSL build. The reason: `enc` was designed before AEAD modes existed in wide use, and it has no mechanism to store or verify the authentication tag GCM produces — encrypting without ever checking that tag would silently throw away GCM's entire security benefit. This is confirmed directly rather than assumed by testing `-K`/`-iv` explicit key/IV forms as well, which fail identically.

**Workaround used:** Python's `cryptography` library, which implements AES-GCM correctly (tag generation and verification both handled):
```python
from cryptography.hazmat.primitives.ciphers.aead import AESGCM
key = AESGCM.generate_key(bit_length=256)
aesgcm = AESGCM(key)
nonce = os.urandom(12)
ciphertext = aesgcm.encrypt(nonce, data, None)  # returns ciphertext + 16-byte tag
```
Result: 85-byte plaintext -> 101-byte ciphertext+tag (85 + 16-byte tag) + 12-byte nonce stored alongside = 113 bytes total. Decryption confirmed identical to the original. **Tampering test:** flipping a single bit in the ciphertext and attempting to decrypt raised `InvalidTag` immediately — GCM detected the modification and refused to produce any output. Running the identical tamper test against the AES-256-CBC ciphertext instead **produces no error at all** — CBC has no authentication mechanism, so a modified ciphertext simply decrypts to different (silently corrupted) plaintext. This is the practical difference between encryption alone and *authenticated* encryption.

### AES-128-CBC

```
openssl enc -aes-128-cbc -pbkdf2 -salt -in patient_record.txt \
  -out patient_record_cbc128.enc -pass pass:MedDefenseLab2026
```
Output file: 112 bytes (identical size to AES-256-CBC — key length does not affect ciphertext size for a fixed block cipher mode). Decryption verified identical to the original.

## Part 2: Performance Measurement (100MB file)

**Test file:** `dd if=/dev/urandom of=testfile bs=1M count=100` -> 104,857,600 bytes.

**Wall-clock encryption time** (`time openssl enc ...`, single run, includes process startup and disk I/O):

| Mode | Real Time |
|---|---|
| AES-256-CBC | 0.118s |
| AES-128-CBC | 0.090s |
| AES-256-GCM (via Python, not `openssl enc`) | 0.270s |

The GCM figure above is **not a clean comparison** — it includes Python interpreter startup overhead that the native OpenSSL CLI calls do not pay, so it overstates GCM's real cost relative to CBC. For a methodologically fair comparison, `openssl speed -evp` benchmarks raw cipher throughput within the same OpenSSL library, free of that confound:

| Cipher | Throughput at 16384-byte blocks (`openssl speed -evp`) |
|---|---|
| AES-256-CBC | 1,734,352.90 KB/s (~1.73 GB/s) |
| AES-128-CBC | 2,364,874.75 KB/s (~2.36 GB/s) |
| AES-256-GCM | 7,704,485.89 KB/s (~7.70 GB/s) |

**The genuinely interesting, slightly counter-intuitive real result: GCM is roughly 4.4x faster than AES-256-CBC on this hardware, not slower.** This is not an accident — CBC encryption is inherently sequential (each ciphertext block feeds into encrypting the next one, so it cannot be parallelized during encryption), while GCM is built on counter mode, which lets independent blocks be encrypted in parallel and benefits directly from AES-NI hardware acceleration on modern CPUs. This is the real, practical reason TLS 1.3 dropped CBC-mode ciphers from its suite entirely and defaults to AES-GCM (or ChaCha20-Poly1305): GCM is not a security-for-speed trade-off in 2026 hardware, it is faster **and** authenticated at the same time. AES-128-CBC is faster than AES-256-CBC (fewer key-schedule rounds: 10 vs. 14), which is the expected, unsurprising half of this comparison.

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x04_crypto_foundation`
- **File:** `1-symmetric_encrypt.sh`
