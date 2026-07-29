# 4. The Key Exchange

**Goal:** Simulate a Diffie-Hellman key exchange with OpenSSL to understand how two parties agree on a shared secret over an insecure channel, then analyze the man-in-the-middle vulnerability that certificates exist to solve.

## Context

The fundamental problem of symmetric encryption is key distribution: Alice and Bob need the same key, but they cannot send it over the network because Eve is listening. In 1976, Whitfield Diffie and Martin Hellman solved this problem with mathematics. You are about to reproduce their solution with OpenSSL.

But their solution has a weakness. If Eve is not just listening but actively intercepting and modifying traffic, Diffie-Hellman alone cannot detect her. This is why certificates exist. The connection between key exchange and PKI is the thread that runs through the rest of this project.

## Instructions

### Part 1 — The DH Simulation

Simulate a Diffie-Hellman key exchange between Alice and Bob using OpenSSL. Document every command and its output:

1. Generate shared DH parameters: `openssl dhparam -out dhparams.pem 2048`
2. Generate Alice's private key from the parameters
3. Extract Alice's public key
4. Repeat for Bob
5. Derive the shared secret from Alice's side using Bob's public key
6. Derive the shared secret from Bob's side using Alice's public key
7. Compare the two secrets: `diff alice_secret.bin bob_secret.bin`

### Part 2 — The Explanation

In 5-6 sentences, explain what just happened in terms a non-cryptographer (for example, Robert Kim, the CFO) could understand. Alice and Bob never exchanged a secret key, yet they both derived the same one. How? What would Eve (listening on the network) have seen, and why could she not derive the same secret?

### Part 3 — The MITM Attack

Describe in 4-5 sentences how a man-in-the-middle attack defeats plain Diffie-Hellman. Eve intercepts Alice's public key, performs her own DH exchange with both Alice and Bob separately, and now has two different shared secrets. Map this to MedDefense: if the VPN tunnel between Central and Westside uses DH without certificate-based authentication, what could an attacker on the network path do? How do certificates prevent this?

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x04_crypto_foundation`
- **File:** `4-key_exchange.md`
