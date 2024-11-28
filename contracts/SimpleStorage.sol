// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract simpleStorage{
    string public message;

    string[3] public array;

    string[] public array1;

    function setMessage(string calldata str)external{
        message = str;
        array[0] = str;
        array[1] = str;

        string[] memory array2 = new string[](3);
        array2[0] = str;
        //array1[0] = str;
        array1 = array2;
        
    }


    function getMessage()external view returns(string memory,string[3] memory){
        return (message,array);
    }
}