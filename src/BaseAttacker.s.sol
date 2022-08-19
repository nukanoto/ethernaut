// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import "forge-std/Script.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./BaseAttacker.sol";

contract BaseAttackerScript is Script {
    function run(address instanceAddr) external {
        vm.startBroadcast();

        BaseAttacker attacker = new BaseAttacker();
        attacker.attack(instanceAddr);

        vm.stopBroadcast();
    }
}
