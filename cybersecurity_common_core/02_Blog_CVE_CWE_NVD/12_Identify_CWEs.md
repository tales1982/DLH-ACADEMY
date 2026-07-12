# 12. Identify CWEs

## Code Under Analysis

```python
import sqlite3

def get_user(username):
    conn = sqlite3.connect('users.db')
    cursor = conn.cursor()
    query = "SELECT * FROM users WHERE username='" + username + "';"
    cursor.execute(query)
    user = cursor.fetchone()
    conn.close()
    return user
```

---

## Step 1 — Identify the Problem

Look at this line:

```python
query = "SELECT * FROM users WHERE username='" + username + "';"
```

The value of `username` comes directly from the caller — and it is **glued into the SQL string with no sanitization**.

If an attacker passes this as `username`:

```
' OR '1'='1
```

The query becomes:

```sql
SELECT * FROM users WHERE username='' OR '1'='1';
```

`'1'='1'` is always true → **the database returns every user in the table**.

Or with this input:

```
admin'; DROP TABLE users; --
```

The query becomes:

```sql
SELECT * FROM users WHERE username='admin'; DROP TABLE users; --';
```

The entire `users` table is **deleted**.

---

## Step 2 — Classify the CWEs

### Primary: CWE-89 — SQL Injection

| Field | Detail |
|---|---|
| **CWE ID** | CWE-89 |
| **Name** | Improper Neutralization of Special Elements used in an SQL Command |
| **Taxonomy level** | Base |
| **Parent** | CWE-943: Improper Neutralization of Special Elements in Data Query Logic |
| **Top 25** | Yes — consistently in the top 3 |

**Root cause:** User input is concatenated directly into an SQL query instead of being treated as data.

---

### Contributing: CWE-20 — Improper Input Validation

| Field | Detail |
|---|---|
| **CWE ID** | CWE-20 |
| **Name** | Improper Input Validation |
| **Taxonomy level** | Class |
| **Role here** | No validation of `username` before use — any string is accepted |

**Root cause:** The function trusts the caller completely. There is no check for length, allowed characters, or format.

---

### Additional: CWE-200 — Exposure of Sensitive Information

| Field | Detail |
|---|---|
| **CWE ID** | CWE-200 |
| **Name** | Exposure of Sensitive Information to an Unauthorized Actor |
| **Role here** | `SELECT *` returns every column — including passwords, tokens, or any sensitive field stored in the table |

---

## Step 3 — Security Implications and Attack Scenarios

### Scenario 1 — Authentication bypass
```
username = "' OR '1'='1"
```
Returns all users. If the application checks `if user: grant_access()`, the attacker logs in as the first user in the table — often an admin.

### Scenario 2 — Data exfiltration
```
username = "' UNION SELECT username, password, null FROM users --"
```
Dumps all usernames and passwords from the database.

### Scenario 3 — Data destruction
```
username = "'; DROP TABLE users; --"
```
Deletes the entire users table. No recovery without a backup.

### Scenario 4 — Full server compromise (in some databases)
In MySQL with `FILE` privilege or SQL Server with `xp_cmdshell`, SQL Injection can lead to **operating system command execution**.

---

## Step 4 — Fix the Code

### The fix: use parameterized queries

```python
import sqlite3

def get_user(username):
    conn = sqlite3.connect('users.db')
    cursor = conn.cursor()
    query = "SELECT id, username FROM users WHERE username = ?;"  # no sensitive columns
    cursor.execute(query, (username,))                            # username passed as data
    user = cursor.fetchone()
    conn.close()
    return user
```

**What changed and why:**

| Change | Reason |
|---|---|
| `?` placeholder instead of string concatenation | The database treats `username` as **data**, never as SQL code — injection is impossible |
| `(username,)` as second argument to `execute()` | The driver handles escaping — the developer does not need to |
| `SELECT id, username` instead of `SELECT *` | Returns only what is needed — passwords and sensitive fields are not exposed (fixes CWE-200) |

### Optional — add input validation (defense in depth)

```python
import re

def get_user(username):
    if not username or len(username) > 50:
        return None
    if not re.match(r'^[a-zA-Z0-9_]+$', username):  # only safe characters
        return None
    conn = sqlite3.connect('users.db')
    cursor = conn.cursor()
    query = "SELECT id, username FROM users WHERE username = ?;"
    cursor.execute(query, (username,))
    user = cursor.fetchone()
    conn.close()
    return user
```

Validation alone does **not** fix SQL Injection — parameterized queries do. Validation is an extra layer (fixes CWE-20).

---

## Summary

| CWE | Severity | Fix |
|---|---|---|
| **CWE-89** SQL Injection | Critical | Use parameterized queries — always |
| **CWE-20** Input Validation | Medium | Validate length and allowed characters |
| **CWE-200** Info Exposure | Medium | Use `SELECT column` instead of `SELECT *` |

> The root lesson: **never build SQL queries with string concatenation**.
> User input is data — let the database driver treat it as data, never as code.
