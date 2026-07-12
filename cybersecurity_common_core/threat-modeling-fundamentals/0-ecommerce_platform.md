# E-commerce Platform Threat Model

## 1. STRIDE Threats for Checkout Process

### Threat 1.- STRIDE type: Tampering

- Threat description: User changes the product price/quantity in the frontend request before checkout.
- Potential Impact: The user is paying less than the real price and suffers a financial loss.
- Recommended mitigation: Back-end validation of prices and totals using trusted database values.

### Threat 2.- Category: Information Disclosure (STRIDE)

- Threat description: Payment or personal data intercepted in transit.
- Potential impact: Disclosure of sensitive customer information.
- Mitigation recommendation: HTTPS/TLS, secure cookies, and never store raw card data.

### Threat #3- Category: STRIDE Spoofing

- Threat description: User A checks out as user B with a stolen session token.
- Possible consequences: Unauthorized purchases or access to personal data.
- Recommended mitigation:

## 2. Trust Boundaries

1. User browser to React frontend/backend APIData comes from an untrusted user device and enters the application.
2. Node.js backend to PostgreSQL databaseThe backend sends queries to the database, which stores sensitive product, user, and order data.
3. Node.js backend to Stripe
   Payment information crosses from the platform to an external payment provider.

## 3. DREAD Rating for SQL Injection in Product Search

- Damage Potential: 10/10SQL injection could expose product, user, or order data.
- Reproducibility: 10/10If the search field is vulnerable, the attack can be repeated easily.
- Exploitability: 9/10An attacker only needs to send malicious input in the search box.
- Affected Users: 10/10Many users could be affected if customer or order data is leaked.
- Discoverability: 9/10
  Product search is public and easy to find.

Average score: 9.6 /10

Risk level: Critical
