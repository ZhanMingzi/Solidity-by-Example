// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FunctionModifier{
    uint public number;

    modifier nonZero() {
    require(number != 0,"number is zero." );
    _;
    }

    function doubleNumber() public nonZero()  {
        number = number*2;
    }

    function resetNumber() public nonZero() {
        number = 0;
    }
}
