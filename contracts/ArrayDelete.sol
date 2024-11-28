// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract arrayDelete{

   uint[] public arr;

    function ArrDel(uint[] memory numb,uint arrayIndex)public returns(uint[] memory) {

        // for(uint i = 0;i<numb.length;i++){
        //     arr.push(numb[i]);
        // }
        arr = numb;

        for(uint i = arrayIndex;i<arr.length-1;i++){
            arr[i] = arr[i+1];
            
        }

        arr.pop();

        return arr;
    }


}