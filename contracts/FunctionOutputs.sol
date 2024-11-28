// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract functionOutputs {

    uint public i;
    bool public b;
    string public s;

    // constructor() {
    //     i = 1;
    //     b = true;
    //     s = "hello";
    // }

    function returnMutiple() public pure returns (uint,bool,string memory){
        return(1,true,"hello");
    }

    function captureOutputs() external {
        (i,b,s) = returnMutiple();
   } 

   function displayOutputs() external view returns (uint i,bool b,string memory s){
        (i,b,s) = returnMutiple();
        return(i,b,s);
   }


}