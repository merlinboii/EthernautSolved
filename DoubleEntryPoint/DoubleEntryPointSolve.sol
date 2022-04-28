pragma solidity 0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * @Solution : create a detecting bot contract and check some vulnabilities condition about msg.sender
 * 1. ERC20 Short Address Attack
 * 2. Validate Input
 */

interface IForta {
    function setDetectionBot(address detectionBotAddress) external;
    function notify(address user, bytes calldata msgData) external;
    function raiseAlert(address user) external;
}

contract DoubleEntryPointHack {
    IForta public forta;
    address legacyToken;

    constructor(address _legacyToken, IForta _fortaInstance) {
        legacyToken = _legacyToken;
        forta = _fortaInstance;
    }
    function handleTransaction(address user, bytes calldata msgData) external {
        if(msgData.length >= 68 && bytes32(IERC20(legacyToken).balanceOf(user)) >= bytes32(msgData[36:68])){
            return;
        }
        forta.raiseAlert(user);
    }
}