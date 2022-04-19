// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * Deploy Fake token to attack
 */

contract FakeToken is ERC20 {
  constructor(string memory name, string memory symbol, uint initialSupply, address victim) public ERC20(name, symbol) {
        _mint(msg.sender, initialSupply);
        _mint(victim, 1);
  }
}