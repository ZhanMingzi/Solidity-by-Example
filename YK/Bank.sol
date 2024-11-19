// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Bank {
    
    mapping(address => uint256) internal UserBalance; 
    uint256 public bankbalance;
    string internal bankName;

    constructor(){
      bankName = "XXX";  
    }

    function deposit(uint _amount) external payable {
        require(_amount == msg.value,"deposit amount error");
        require(_amount > 0,"deposit amount should greater than 0");

        bankbalance += _amount;
        UserBalance[msg.sender] += _amount;

        require(address(this).balance == bankbalance,"bank balance is not right");

    }

    function whihdraw(uint _amount) external {
        require(_amount <= UserBalance[msg.sender],"balance is not enough");
        require(_amount > 0,"withdraw amount should greater than 0");


        bankbalance -= _amount;
        UserBalance[msg.sender] -= _amount;

        payable(msg.sender).transfer(_amount);

        require(address(this).balance == bankbalance,"bank balance is not right");

    }

    function transfer(address _transferTo,uint _amount) external {
        require(_amount >= UserBalance[msg.sender],"balance is not enough");
        require(_amount > 0,"withdraw amount should greater than 0");

        //bankbalance -= _amount;
        UserBalance[msg.sender] -= _amount;
        UserBalance[_transferTo] += _amount;


    }

    function getBalance(address _queryAddress) external view returns(uint){

        return UserBalance[_queryAddress];

    }

}