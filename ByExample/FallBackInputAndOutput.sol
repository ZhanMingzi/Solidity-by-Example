// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Counter{

    uint256 public counter;
     
     function inc() external returns(uint256){

        counter++;

        return counter;


     }
}

contract FallBackInputAndOutput{

    address public counter_address;

    constructor(address _counter_address){

    counter_address = _counter_address;

    }

    fallback(bytes calldata _data) external payable returns(bytes memory){
       (bool success,bytes memory result) = counter_address.call(_data);
       return result;
     }

}

contract TestFallback{

    function getTestData(address _FallBackInputAndOutput) external returns (bytes memory) {

    (bool success,bytes memory result) = _FallBackInputAndOutput.call(abi.encodeWithSelector(Counter.inc.selector));
    return result;


    }
}