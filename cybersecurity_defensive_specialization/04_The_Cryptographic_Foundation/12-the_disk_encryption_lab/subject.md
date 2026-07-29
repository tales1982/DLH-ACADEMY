# 12. The Disk Encryption Lab

**Goal:** Set up LUKS disk encryption on a loop device, understand the operational implications and design a backup encryption strategy for MedDefense.

## Context

NAS-01 stores all MedDefense backups in plaintext. If the NAS is stolen, every patient record is exposed. If the NAS is accessed through the flat network (which your 1x01 kill chains demonstrated), the backups are readable. Encrypting the backup storage at rest is a Phase 1 priority from your roadmap.

Before you touch production, you practice on a safe target: a loop device on your own machine.

## Instructions

### Part 1 - LUKS Setup

Create a 500MB file to use as a virtual disk:

```
dd if=/dev/zero of=encrypted_volume.img bs=1M count=500
```

Set up LUKS encryption on this file:

1. Format with LUKS: `sudo cryptsetup luksFormat encrypted_volume.img`
2. Open the encrypted volume: `sudo cryptsetup luksOpen encrypted_volume.img secure_vol`
3. Create a filesystem: `sudo mkfs.ext4 /dev/mapper/secure_vol`
4. Mount and write test data
5. Unmount and close: `sudo cryptsetup luksClose secure_vol`

Document every command and its output.

### Part 2 - Verification

After closing the LUKS volume, attempt to read the raw file:

```
strings encrypted_volume.img | head -50
```

Can you see the data you wrote? What does this prove about encryption at rest?

Now reopen the volume and verify the data is intact. Document the full open-mount-read-unmount-close cycle.

### Part 3 - The LUKS Automation Script

Write a script `12-luks_manager.sh` that accepts a mode argument:

- `create`: creates a LUKS-encrypted volume of a specified size
- `open`: opens and mounts the volume
- `close`: unmounts and closes the volume

### Part 4 - MedDefense Backup Encryption Design

Design the encryption-at-rest strategy for NAS-01. Address:

- Which encryption level is appropriate (full-disk, volume, file-level) and why
- What happens to backup performance (estimate the overhead based on your T1 performance measurements)
- Where the encryption key is stored (NOT on the NAS itself, explain why)
- What happens if the key is lost (backup recovery implications)
- How this integrates with the offsite backup replication control from your 1x03 strategy (must the cloud replica also be encrypted, and with whose key?)

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x04_crypto_foundation`
- **File:** `12-luks_manager.sh`, `12-disk_encryption.md`
