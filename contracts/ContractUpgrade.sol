// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract V1{

    address public implementation;
    address public admin;
    uint public count;

    function inc() external {
        count += 1;
    }

}

contract V2{

    address public implementation;
    address public admin;
    uint public count;

    function inc() external {
        count += 1;
    }

    function dec() external {
        count -= 1;
    }
}

contract BuggyProxy {

    address public implementation;
    address public admin;

    constructor(){
        admin = msg.sender;
    }
    
    // function _delegate() private {
    //     (bool ok,bytes memory res) = implementation.delegatecall(msg.data);
    //     require(ok,"delegatecall failed");
    // }

    function _delegate() private {
    
    }

    fallback() external payable {
        _delegate();
     }

    receive() external payable {
        _delegate();
     }

    function upgradeTo(address _implementation) external  {
        require(msg.sender == admin,"not autorized");
        implementation = _implementation;
    }

}