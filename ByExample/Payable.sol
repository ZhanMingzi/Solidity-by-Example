// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Payable{
    address payable public owner;

    event Log(string message,uint val);

    constructor(){
        //owner = payable(msg.sender);
    }

    //function deposit() external {}

    function getBalance() external view returns(uint){
        return address(this).balance;
    }

    fallback() external payable {
        //revert("Function not payable");
       //emit Log("Function not payable", 1234);
     }
}

