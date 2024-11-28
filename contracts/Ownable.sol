// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract MyOwnable {
    address public owner;

    uint public callcount;

    constructor() {
        owner = msg.sender;
        callcount = 0;
    }

    modifier onlyowner() {
        require(owner == msg.sender,"not current owner");
        _;
    }

    function transferOwnerShip(address _owner) external onlyowner{
        require(owner != address(0),"owner is invalid");
        owner = _owner;
    }

    function callCallCount() external {
        callcount++;
    }

    function cleanCount() external onlyowner{
        callcount = 0;
    }





}