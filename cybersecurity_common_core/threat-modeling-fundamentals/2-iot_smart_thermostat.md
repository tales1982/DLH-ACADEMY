# IoT Smart Thermostat

## 1. IoT-specific threats

1. Physical tampering of the device.
2. Access through debug ports (UART, JTAG, SPI).
3. Weak default credentials.
4. Firmware extraction and reverse engineering.
5. Malicious or insecure OTA updates.

## 2. Physical access attack chain

1. Attacker gains physical access to the thermostat.
2. Connects to a debug port.
3. Extracts firmware or stored credentials.
4. Modifies firmware or steals sensitive data.
5. Gains control of the device or access to the home network.

### Impacts

* Wi-Fi credential theft.
* Unauthorized device control.
* Network compromise.
* Privacy and security risks.

## 3. OTA security controls

1. Digital code signing.
2. Firmware signature verification.
3. Secure Boot.
4. HTTPS/TLS encrypted communication.
5. Rollback protection.
6. Integrity verification.

## Conclusion

A smart thermostat must be protected against physical attacks, firmware manipulation, and insecure updates. Secure OTA updates and hardware protections are essential security requirements.
