// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

contract DeployWithCreate2{
    address public owner;

    constructor(address _owner){
        owner = _owner;
    }
}

contract Create2Factory{

    event Deploy (address addr);

   // DeployWithCreate2 public _contract;

    address public dataTypeTest;

    bytes public byteCode;

    function deploy(uint _salt) external  {
       DeployWithCreate2 _contract = new DeployWithCreate2{salt:bytes32(_salt)}(msg.sender);
        dataTypeTest = address(_contract);
        //return _contract;
       // dataTypeTest = _contract;

    
    }

    function getAddress(bytes memory _bytecode,uint _salt) public view returns(address){
        bytes32 bytecodeHash = keccak256(
            abi.encodePacked(
                bytes1(0xff),
                address(this),
                _salt,
                keccak256(_bytecode)
            
            )
        );
        return address(uint160(uint256(bytecodeHash)));
    }

    function getBytecode(address _owner) public pure returns(bytes memory){

        bytes memory bytecode 
         = type(DeployWithCreate2).creationCode;

        //byteCode = bytecode;

        return abi.encodePacked(bytecode,abi.encode(_owner));

    }
}

//0x3744E1baCb235821d51af32c3b4B129F2A6b7D1C