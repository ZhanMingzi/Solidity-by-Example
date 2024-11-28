// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract example {
    function ifElse (int x) external pure returns(string memory){
        if (x<5 && x>0){
            return "mimi still young";
        } else if (x >= 5 && x < 10){
            return "mimi is old";
        } else if (x >=10 ){
            return "mimi already dead";
        }else {
        return "input error";
        }
}

    function tenary(int y) external pure returns(string memory){
        return y <= 5 ? "mimi still young" : "mimi is old";
    }

    function homeWork(uint z) external pure returns(string memory){
        if (z<10){
            return "less then 10";
        }else if (z >= 10 && z<=20){
            return "between 10 and 10";
        }else 
            return "greater then 10";
    }
}