// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract forAndWhileLoops {

    function forFunc(uint x) external pure returns(uint){

        uint sum = 0;

        for (uint i=1;i <= x;i++){
            sum = sum+i;

        }

        return sum;
    }

    function whileFunc(int y) external pure returns(int){
        int sum = 0;
        while(y > 0){
            sum = sum+y;
            y--;
            
        }

        return sum;
    }
}