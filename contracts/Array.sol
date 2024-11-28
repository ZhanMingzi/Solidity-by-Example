// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Array{
    uint[] public numb = [1,2,3];
    uint[3] public fixedNumb = [4,5,6];

        // numb = [1,2,3];
        // fixedNumb = [4,5,6];
    

    function insertNumb(uint x)public {
       numb.push(x);
    }

    function returnNumb(uint y)public view returns(uint) {
       return numb[y];

    }

    function updateNumb(uint updateIndex,uint updateValue)public {
        numb[updateIndex] = updateValue;
    }

    function deleteNumb(uint deleteIndex) public {
        delete numb[deleteIndex];
    }

    function numbLength() public view returns(uint){
        return numb.length;
    }

    function returnNumb() public view returns(uint[] memory){
    return numb;
    }

}