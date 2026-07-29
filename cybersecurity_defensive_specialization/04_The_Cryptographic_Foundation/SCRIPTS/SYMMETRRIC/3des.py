#!/usr/bin/env python3
# triple_des.py
from Crypto.Cipher import DES3
from Crypto.Random import get_random_bytes
import base64

texto = input("Digite o texto: ").encode("utf-8")

chave = DES3.adjust_key_parity(get_random_bytes(24))
cipher = DES3.new(chave, DES3.MODE_EAX)

criptografado, tag = cipher.encrypt_and_digest(texto)

print("Chave:", base64.b64encode(chave).decode())
print("Nonce:", base64.b64encode(cipher.nonce).decode())
print("Texto criptografado:", base64.b64encode(criptografado).decode())

decipher = DES3.new(chave, DES3.MODE_EAX, nonce=cipher.nonce)
descriptografado = decipher.decrypt_and_verify(criptografado, tag)

print("Texto descriptografado:", descriptografado.decode())