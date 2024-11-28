// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/*
    X
   / |
  Y  |
   \ |
    Z

X,Y,Z

*/

contract A{

    function foo() public pure virtual returns(string memory){
        return "A";
    }

}

contract B is A{
    function foo() public pure override virtual returns(string memory){
        return "B";
    }
}

contract C is A,B {
    function foo() public pure override(A,B) returns(string memory){
        return "C";
    }

}