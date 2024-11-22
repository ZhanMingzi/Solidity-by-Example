// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract EventDemo{
    event Log(string message,uint val);
    event LogIndexed(address indexed sender,uint val);

    function example() external{
        emit Log("foo",1234);
        emit LogIndexed(msg.sender, 1234);
    }

    event Message(address indexed _from,address indexed _to,string message);

    function sendMessage(address _to,string calldata message) external {
        emit Message(msg.sender,_to,message);
    }
}