// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract InterableMapping{

    mapping(address => uint) public balance;

    mapping(address => bool) public inserted;

    address[] public keys;

    function set(address x,uint i) public {
        if(!inserted[x]){
            inserted[x] = true;
            keys.push(x);
            balance[x] += i;
        }

        //keys.push(x);

        //balance[x] += i;
    } 

    function getSize() public view returns(uint){
        return keys.length;
    }

    function getBalance(uint Index) public view returns(uint){
        return balance[keys[Index]];
    }

}

