
# **Title:** Symmetric Encryption: Algorithms, Modes of Operation, and Practical Choices

---

Symmetric encryption is the foundation of modern cryptography: the same key both encrypts and decrypts. It's fast and efficient, ideal for large volumes of data, such as entire databases or backups. Its main limitation is key distribution — since both parties need to securely share the same secret key, it's usually combined with asymmetric encryption (which handles key exchange) in systems like TLS.

**AES** is the current standard, with key sizes of 128, 192, or 256 bits — all considered secure today, with AES-256 required for highly sensitive data. Before it came **DES** (broken by brute force since 1999, with a key of only 56 bits — today such an attack would take minutes with common hardware) and **3DES** (a stopgap that applies DES three times to increase the effective key size, but now obsolete and already deprecated by NIST). **ChaCha20** (paired with Poly1305 for authentication) is a modern alternative to AES: while AES relies on dedicated hardware instructions (AES-NI) to run fast, ChaCha20 was designed to be efficient in pure software, which is why it's preferred on mobile devices and embedded systems that lack that acceleration.

Beyond the algorithm, the **mode of operation** is crucial. **CBC** chains blocks together (each block is combined with the previous one before encryption), but this only guarantees confidentiality, not integrity — an attacker can alter ciphertext bits in predictable ways, and decryption "succeeds" without visible error, yet produces corrupted or manipulated data with no alarm raised. **GCM** solves this by combining a counter-based stream mode with authentication: it generates a cryptographic tag computed from the entire encrypted content, and any alteration — even a single bit — changes that tag, allowing tampering to be detected before the data is even used. That's why GCM is the recommended mode today, while CBC without an extra layer like HMAC is considered fragile.

**RC4** is definitively banned from modern use — researchers identified statistical biases in its keystream that, given enough data, allow recovery of key or plaintext information; it was removed from TLS as a result.  **Blowfish** , while not technically broken, uses a small 64-bit block size (versus AES's 128 bits). This makes it vulnerable to birthday attacks: with large volumes of data encrypted under the same key, the probability of block collisions grows faster than intuition suggests, potentially leaking information. This is why it has been largely replaced by AES.

In practice, **AES-256-GCM** is the ideal choice for critical data: GCM provides built-in integrity, and the 256-bit key offers a security margin against future attacks — including quantum computers, which halve the effective security of symmetric keys (via Grover's algorithm), making AES-256 preferable to AES-128 for systems intended to last decades.




# **Title:** Asymmetric Encryption: The Engine Behind Everything

---


If symmetric encryption is the workhorse, asymmetric encryption is the handshake. It solves a problem symmetric encryption alone cannot: how do two parties who have never met agree on a shared secret, without exchanging that key over a channel that might be under surveillance? The answer involves a pair of mathematically related keys — a public one, which can be freely distributed, and a private one, which never leaves its owner's device. Whatever one key encrypts, only the other can decrypt.

**RSA** is the most established asymmetric algorithm, based on the computational difficulty of factoring very large numbers that are the product of two primes. RSA-2048 is today's acceptable minimum; RSA-4096 offers additional margin at the cost of more processing. **ECC** (Elliptic Curve Cryptography) achieves equivalent security with drastically smaller keys — a 256-bit ECC key (P-256 curve) offers security comparable to a 3072-bit RSA key — because it relies on the difficulty of the discrete logarithm problem on elliptic curves, which is mathematically harder to attack per unit of key size. This size difference isn't cosmetic: in environments with limited processing power, such as embedded medical devices or monitoring systems, smaller keys mean lower battery consumption, less latency, and real implementation feasibility.

But asymmetric encryption has a structural limitation: it wasn't designed to encrypt large volumes of data. Trying to encrypt a 100 MB file directly with RSA fails or is impractically slow, because the amount of data RSA can encrypt is limited by the key size, and each operation is orders of magnitude slower than an equivalent symmetric operation. That's why, in practice, no one uses pure asymmetric encryption for bulk data.

The solution is the  **hybrid model** , used by TLS and virtually all modern encrypted communication: asymmetric encryption is used only to negotiate and exchange a symmetric session key; from that point on, all actual data payload is encrypted symmetrically, with AES or ChaCha20. When accessing a site over HTTPS, the TLS handshake uses asymmetric encryption (typically ECDHE key exchange, anchored by the server certificate's public key) to establish a shared secret; all subsequent traffic is protected by a symmetric cipher derived from that secret. The result combines the best of both worlds: asymmetric encryption's ability to solve key distribution without prior contact, and symmetric encryption's speed for the actual data volume.


# **Title:** Hashing, Salting, and Key Stretching

---

Hashing is not encryption. Encryption is reversible — with the right key, ciphertext turns back into plaintext. Hashing is one-way: it takes an input of any size and produces a fixed-size output, with no inverse operation. This matters enormously in systems that store password hashes — the difference between a well-designed hash and a poorly designed one is the difference between "the attacker has the hashes but can't use them" and "the attacker has everyone's password in 30 minutes."

A good cryptographic hash has three properties: preimage resistance (given a hash, infeasible to find the original input), second preimage resistance (given an input, infeasible to find another with the same hash), and collision resistance (infeasible to find any two inputs with the same hash). SHA-256, SHA-512, and SHA-3 satisfy these today. MD5 and SHA-1 don't — both have demonstrated collision attacks and are considered broken for uses like digital signatures and integrity checks.

One observable property is the  **avalanche effect** : changing a single input character should alter roughly 50% of output bits, unpredictably — preventing pattern inference. Hash size matters too: a 128-bit hash (MD5) has 2^128 possible outputs, but the birthday paradox cuts the practical effort to find a collision to about 2^64 attempts, achievable today. A 256-bit hash raises that to 2^128, out of realistic reach.

Hashing a password without a salt is a serious flaw: an attacker can precompute common hashes into rainbow tables and look up the stolen hash — sites like CrackStation do this publicly for unsalted MD5/SHA-1. A **salt** — a unique random value per user, combined with the password before hashing — defeats rainbow tables by forcing a new table per salt.

But a salt alone isn't enough against attackers computing billions of hashes per second on GPUs. That's where **key stretching** comes in: bcrypt, PBKDF2, and Argon2 apply the hash thousands/millions of times (or demand heavy memory use), with a tunable "cost factor" to stay slow even as hardware improves. Argon2, winner of the Password Hashing Competition, is today's strongest recommendation, resisting both GPU and ASIC attacks. Active Directory defaults to NTLM (MD4-based, unsalted) — inadequate — and Kerberos setups that accept RC4 inherit MD5-related weaknesses, enabling offline password-recovery attacks.


# **Title:** Digital Signatures: Integrity, Authentication, and Non-Repudiation

---

A digital signature delivers three properties simultaneously, and it's this combination that makes it unique among cryptographic mechanisms: integrity (the content hasn't been altered since signing), authentication (the signer really is who they claim to be), and non-repudiation (the signer cannot credibly deny having signed it later). No single mechanism — not hashing alone, not symmetric encryption — delivers all three at once.

The process is the conceptual inverse of traditional asymmetric encryption: instead of encrypting with the recipient's public key, the signer computes a hash of the document and encrypts that hash with their own private key. Anyone with the corresponding public key can decrypt that signature, recompute the hash of the received document, and compare the two values. If they match, the document hasn't been altered and was indeed signed by whoever holds that private key — and since only the legitimate owner should have access to the private key, they cannot deny having signed it.

This isn't an academic concern in regulated contexts: sensitive electronic documents, consent forms, and audit logs often require digital signatures to hold legal validity under regulations like HIPAA and the U.S. ESIGN Act. A digitally signed document from a professional is only legally defensible if any subsequent alteration — even a single character — visibly invalidates the signature, and if the private key used to sign it is in fact under the signer's exclusive control.

It's worth noting the difference in purpose between a TLS certificate and a document's digital signature: the former authenticates a server during a communication session; the latter permanently binds a person (or system) to a specific document, with validity that must outlast the session in which it was created by far. This means key management for signing sensitive documents demands extra care: if a signer's private key is compromised, every document signed with it — past and future, until revocation — falls under suspicion, with legal implications far broader than simply rotating a server certificate.
