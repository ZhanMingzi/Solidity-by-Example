// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract TestMultiCall{

    function func1() external view returns(uint,uint){
        return (1,block.timestamp);
    }

    function func2() external view returns(uint,uint){
        return (2,block.timestamp);
    }

    function getData1() external  pure returns(bytes memory,bytes4){
        return (abi.encodeWithSelector(this.func1.selector),
        bytes4(keccak256(bytes("func1()")))
        );

    }

    function getData2() external  pure returns(bytes memory,bytes4){
        return (abi.encodeWithSelector(this.func2.selector),
        bytes4(keccak256(bytes("func2()")))

        );

    }

}

    contract MutiCall{

        function MutiCallFunc(address[] memory addr,bytes[] memory selector) external view returns (bytes[] memory){
            require(addr.length == selector.length,"addr and data array data number not mapped");

            bytes[] memory results = new bytes[](addr.length);

            for (uint i = 0; i < addr.length; i++) 
            {
             (bool success,bytes memory result) = addr[i].staticcall(selector[i]);

             require(success,"call faild");

            results[i] = result;
            }
             return results;
        }
    }

    //0x3c725134d74D5c45B4E4ABd2e5e2a109b5541288
    //["0x56a2777e796eF23399e9E1d791E1A0410a75E31b","0x56a2777e796eF23399e9E1d791E1A0410a75E31b"]
    //["0x74135154","0xb1ade4db"]