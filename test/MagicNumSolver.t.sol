// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

contract MagicNumSolverTest is Test {
    MagicNumSolver public magicNumSolver;

    function setUp() public {
        magicNumSolver = MagicNumSolver(HuffDeployer.deploy("MagicNumSolver"));
    }

    function testWhatIsTheMeaningOfLife() public {
        uint256 result = magicNumSolver.whatIsTheMeaningOfLife();
        assertEq(42, result);
    }
}

interface MagicNumSolver {
    function whatIsTheMeaningOfLife() external view returns (uint256);
}
