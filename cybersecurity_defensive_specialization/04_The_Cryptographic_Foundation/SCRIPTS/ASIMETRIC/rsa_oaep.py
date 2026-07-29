# rsa.py
from cryptography.hazmat.primitives.asymmetric import rsa, padding
from cryptography.hazmat.primitives import hashes
import base64

# Gerar as duas chaves
chave_privada = rsa.generate_private_key(
    public_exponent=65537,
    key_size=2048
)

chave_publica = chave_privada.public_key()

texto = input("Digite o texto: ").encode("utf-8")

# Criptografar com a chave pública
criptografado = chave_publica.encrypt(
    texto,
    padding.OAEP(
        mgf=padding.MGF1(algorithm=hashes.SHA256()),
        algorithm=hashes.SHA256(),
        label=None
    )
)

print("Texto criptografado:")
print(base64.b64encode(criptografado).decode())

# Descriptografar com a chave privada
descriptografado = chave_privada.decrypt(
    criptografado,
    padding.OAEP(
        mgf=padding.MGF1(algorithm=hashes.SHA256()),
        algorithm=hashes.SHA256(),
        label=None
    )
)

print("Texto descriptografado:")
print(descriptografado.decode())