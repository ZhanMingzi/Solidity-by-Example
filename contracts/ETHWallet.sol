// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract EthWallet{

    address payable owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function getBalance() external view returns(uint){
        //return msg.sender.balance;
        return address(this).balance;
    }

    receive() external payable { }

    function withdraw(uint amount) external {
        require(owner == msg.sender,"not current owner");
        payable(owner).transfer(amount);
    }

}