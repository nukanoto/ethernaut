// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import "forge-std/Script.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./DexTwoAttacker.sol";

contract DexTwoAttackerScript is Script {
    function run(address instanceAddr) external {
        vm.startBroadcast();

        DexTwoAttacker attacker = new DexTwoAttacker();
        attacker.attack(instanceAddr);

        vm.stopBroadcast();
    }
}

