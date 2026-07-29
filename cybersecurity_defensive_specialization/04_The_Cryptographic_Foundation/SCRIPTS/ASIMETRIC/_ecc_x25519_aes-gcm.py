# ecc_x25519.py
from cryptography.hazmat.primitives.asymmetric.x25519 import (
    X25519PrivateKey
)
from cryptography.hazmat.primitives.kdf.hkdf import HKDF
from cryptography.hazmat.primitives.ciphers.aead import AESGCM
from cryptography.hazmat.primitives import hashes
import os
import base64

# Chaves do destinatário
privada_destinatario = X25519PrivateKey.generate()
publica_destinatario = privada_destinatario.public_key()

# Chave temporária do remetente
privada_remetente = X25519PrivateKey.generate()
publica_remetente = privada_remetente.public_key()

texto = input("Digite o texto: ").encode("utf-8")

# Remetente cria o segredo compartilhado
segredo_remetente = privada_remetente.exchange(
    publica_destinatario
)

chave_aes = HKDF(
    algorithm=hashes.SHA256(),
    length=32,
    salt=None,
    info=b"criptografia-ecc"
).derive(segredo_remetente)

nonce = os.urandom(12)
aes = AESGCM(chave_aes)
criptografado = aes.encrypt(nonce, texto, None)

print("Nonce:", base64.b64encode(nonce).decode())
print("Texto criptografado:", base64.b64encode(criptografado).decode())

# Destinatário recria o mesmo segredo
segredo_destinatario = privada_destinatario.exchange(
    publica_remetente
)

chave_aes_destinatario = HKDF(
    algorithm=hashes.SHA256(),
    length=32,
    salt=None,
    info=b"criptografia-ecc"
).derive(segredo_destinatario)

aes_destinatario = AESGCM(chave_aes_destinatario)
descriptografado = aes_destinatario.decrypt(
    nonce,
    criptografado,
    None
)

print("Texto descriptografado:", descriptografado.decode())