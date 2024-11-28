// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract send{
    //0xd9145CCE52D386f254917e481eB44e9943F39138
    constructor() payable{}

    //receive() external payable {}
    
    event Log(uint amount,uint gas);

    //function testSendETH() external payable{}

    function transferETH(address payable _to,uint amount) external {
        _to.transfer(amount);
    }

    function sendETH(address payable _to,uint amount) external {
        bool success = _to.send(amount);
        require (success,"send faild");
    }

    function callETH(address payable _to,uint amount) external {
        (bool success,) = _to.call{value: amount}("");
        require (success,"send faild");
    }

}

contract receiver{
//0x7EF2e0048f5bAeDe046f6BF797943daF4ED8CB47
    event Log(uint amount,uint gas);

    receive() external payable {
        emit Log(msg.value,gasleft());
    }

    function getBalance() external view returns(uint){
        return address(this).balance;
    }

}