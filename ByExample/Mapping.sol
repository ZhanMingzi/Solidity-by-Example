// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract SimpleBank{
    mapping(address => mapping(uint => uint)) public balance;

    function deposit(address account,uint password,uint savingAmount) public {
        balance[account][password] += savingAmount;
    }

    function withdraw(address account,uint password,uint withdrawAmount) public {
        balance[account][password] -= withdrawAmount;
    }

    function checkBalance(address account,uint password) public view returns(uint) {
        return balance[account][password];
    }


}