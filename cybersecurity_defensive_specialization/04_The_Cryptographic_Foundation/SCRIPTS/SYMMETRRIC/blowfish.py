#!/usr/bin/env python3
# blowfish.py
from Crypto.Cipher import Blowfish
from Crypto.Random import get_random_bytes
import base64

texto = input("Digite o texto: ").encode("utf-8")

chave = get_random_bytes(32)
cipher = Blowfish.new(chave, Blowfish.MODE_EAX)

criptografado, tag = cipher.encrypt_and_digest(texto)

print("Chave:", base64.b64encode(chave).decode())
print("Nonce:", base64.b64encode(cipher.nonce).decode())
print("Texto criptografado:", base64.b64encode(criptografado).decode())

decipher = Blowfish.new(chave, Blowfish.MODE_EAX, nonce=cipher.nonce)
descriptografado = decipher.decrypt_and_verify(criptografado, tag)

print("Texto descriptografado:", descriptografado.decode())