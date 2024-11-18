// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract MutiSigWallet{

    struct Transaction{
        address to;
        uint256 value;
        bytes data;
        bool executed;
    }

    address[] public owners;

    mapping(address => bool) public isOwner;

    uint public required;

    Transaction[] public transaction;

    mapping(uint => mapping(address => bool)) public approved;

    constructor(address[] memory _owners,uint _required){

        for(uint i = 0;i<_owners.length;i++){
            owners.push(_owners[i]);

            isOwner[_owners[i]] = true;
        }

        required = _required;


    }

    receive() external payable { }

    function approve(uint _txId) external {

        approved[_txId][msg.sender] = true;

    }

    function submit(address _to,uint256 _value,bytes calldata _data) external {

        transaction.push(Transaction({
            to: _to,
            value: _value,
            data: _data,
            executed: false

        }));

    }

    function execute(uint txId) external{

        Transaction storage transaction = transaction[txId];

        transaction.executed = true;

        (bool success,) = transaction.to.call{value: transaction.value}

    }

    function revoke() external{

    }



}