// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract CallFunctionWithKeyValue{

    function Base(uint x,address addr,uint y) public pure returns(uint,address,uint){

        return (x,addr,y);

    }

    function Caller() external pure returns(uint,address,uint){

        return Base({
            x: 1,
            y: 3,
            addr: address(1)

        });

    }

}