// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract DeleteArrayDemo{
    uint[] public _arr;
    //[0,1,2,3,4]

    function efficientRemove(uint[] memory arr,uint arrIndex) public{
        _arr = arr;
        _arr[arrIndex] = _arr[arr.length-1];
        
        _arr.pop();
    }

    function test()external view{
        
        assert(_arr.length == 4);
        assert(_arr[0] == 0);
        assert(_arr[1] == 1);
        assert(_arr[2] == 4);
        assert(_arr[3] == 3);
    }

    function returnArr() external view returns(uint[] memory){
        return _arr;
    }

}