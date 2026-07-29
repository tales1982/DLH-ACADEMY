#!/usr/bin/env python3
# chacha20.py
from Crypto.Cipher import ChaCha20_Poly1305
from Crypto.Random import get_random_bytes
import base64

texto = input("Digite o texto: ").encode("utf-8")

chave = get_random_bytes(32)
cipher = ChaCha20_Poly1305.new(key=chave)

criptografado, tag = cipher.encrypt_and_digest(texto)

print("Chave:", base64.b64encode(chave).decode())
print("Nonce:", base64.b64encode(cipher.nonce).decode())
print("Texto criptografado:", base64.b64encode(criptografado).decode())

decipher = ChaCha20_Poly1305.new(key=chave, nonce=cipher.nonce)
descriptografado = decipher.decrypt_and_verify(criptografado, tag)

print("Texto descriptografado:", descriptografado.decode())