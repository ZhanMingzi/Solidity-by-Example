// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Immutable{

    address public immutable owner;

    constructor(){
        owner = msg.sender;
    }

    function test() external view returns(address){
        require(owner == msg.sender);
        return owner;
    }
}