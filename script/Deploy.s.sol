// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Script.sol";

interface MagicNumSolver {
    function whatIsTheMeaningOfLife() external view returns (uint256);
}

contract Deploy is Script {
    function run() public returns (MagicNumSolver magicNumSolver) {
        address solverAddress = HuffDeployer.broadcast("Solver");
        vm.broadcast();
        magicNumSolver = MagicNumSolver(HuffDeployer.deploy("MagicNumSolver"));
    }
}
