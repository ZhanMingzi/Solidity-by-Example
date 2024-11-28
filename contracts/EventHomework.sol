// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract EventHomework{
    event LogMessage(address indexed sender,address indexed reciver,string message);

    function sendMessage(address receiver,string memory message) external{
        emit LogMessage(msg.sender,receiver,message);
    }
}