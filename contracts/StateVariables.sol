// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract SimpleStorage {
    uint public storedData;

    address public myAddress;

    function set (uint i) external{
    storedData = i;
    }

    function get() external returns(uint j){
    j = storedData;
    address x;
    x = address(8);
    myAddress = x;
    return j;
    }
    
}