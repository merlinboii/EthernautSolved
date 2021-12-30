pragma solidity ^0.6.0;

/** Find bytes of "pwn" */
contract delegateCallHack {
    address public owner;

    constructor () public {
        owner = msg.sender;
    }

    function getBytes() public returns (bytes memory) {
        return abi.encodeWithSignature("pwn()");
    }
}