// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Constracor{
    address public owner;
    uint public x;

    constructor(uint _x){
    x = _x;
    owner = msg.sender;
    }
}