// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Uncheck{

    function function1(uint x,uint y) external pure returns(uint){

        unchecked{
            return x+y;
        }
    }

    function function2(uint x,uint y) external pure returns(uint){

        return x+y;

    }
}