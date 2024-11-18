// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract DelegationCall{

    error DelegateCallFaild();

    function delegationCall(bytes[] calldata data) external  {

        bytes[] memory results = new bytes[](data.length);

        for (uint i; i<data.length; i++) 
        {
            (bool success, bytes memory result) = address(this).delegatecall(data[i]);
            //delegatecall
            if(!success){
                revert DelegateCallFaild();
            }
            else{
                results[i] = result;
            }
        }


    }


}


contract Main is DelegationCall {

    event Log(address Caller,string Message);

    function func1(uint x,uint y) external returns(uint){

        //uint sum = x + y;
        emit Log(msg.sender, "func1");


        return x+y;

    }

    function func2() external {

        emit Log(msg.sender, "func2");
    }

    function getFunc1Data(uint x,uint y) external pure returns (bytes memory) {
        return abi.encodeWithSelector(this.func1.selector,x,y);
    } 

    function getFunc2Data() external pure returns (bytes memory) {
        return abi.encodeWithSelector(this.func2.selector);
    }
}


