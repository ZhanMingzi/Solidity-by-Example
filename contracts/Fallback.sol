// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Fallback{

    event Log(string str);

    fallback() external payable{
        emit Log("fallback");

    }

    // receive() external payable{
    //     emit Log("receive");
    // }

}