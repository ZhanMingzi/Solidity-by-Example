// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract BitWiseOperators{

    function And(uint x, uint y)external pure returns (uint){
        return x & y;
    }

    function Or(uint x,uint y)external pure returns (uint){
        return x | y;

    }

    function Xor(uint x,uint y)external pure returns (uint){
        return x ^ y;
    }

    function Not(uint8 x)external pure returns(uint){
        return ~x;
    }

    function getLastBits(uint x, uint n) external pure returns(uint){
        uint mask = (1 << n) -1;
        return x & mask;
        //return mask;

    }
}