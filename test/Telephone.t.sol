// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import "forge-std/Test.sol";
import "src/Telephone.sol";
import "src/TelephoneAttacker.sol";

contract TelephoneTest is Test {
    Telephone telephone;

    function setUp() public {
        telephone = new Telephone();
    }

    function test() public {
        TelephoneAttacker attacker = new TelephoneAttacker();
        attacker.attack(address(telephone));
        assertEq(telephone.owner(), address(this));
    }
}
