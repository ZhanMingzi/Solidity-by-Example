// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Error {

    uint public numb = 123;

    function testRequire(uint x) external pure {
        require(x<=10,"x>10");
    }

    function testRevert(uint y) external pure{
        
        if(y>=100){
            revert("y > = 100");
        }
    }

    function testAssert() external view {
        assert(numb == 123);
    }

    function addNumb() external {
        numb = numb + 1;
    }

    error RunhuaEr(address caller,uint i);

    function testCustomerError(uint i) public view{
        if(i != 123){
           revert RunhuaEr(msg.sender,i);
        }
    }
}

