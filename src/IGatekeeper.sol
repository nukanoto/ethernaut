pragma solidity >=0.6.0;

interface IGatekeeper {
    function enter(bytes8 _gateKey) external returns (bool);
}
