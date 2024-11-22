// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract viewAndPureFunction{

    address public myaddress = address(15);

    function pureFunc(uint x,uint y) external pure returns(uint){
        return x*y;
    }

    function viewFunc() external view returns(address){
        return myaddress;
    }

}