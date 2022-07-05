// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.6.0;

import "forge-std/Test.sol";
import "src/CoinFlip.sol";
import "src/CoinFlipAttacker.sol";

contract CoinFlipTest is Test {
    CoinFlip coinflip;

    function setUp() public {
      coinflip = new CoinFlip();
    }

    function test() public {
      CoinFlipAttacker attacker = new CoinFlipAttacker();
      while (10 < coinflip.consecutiveWins()) {
        bool result = attacker.attack(address(coinflip));
        if (!result) {
          revert("failed");
        }
      }
      assertTrue(true);
    }
}
