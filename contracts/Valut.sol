// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./ERC20ForValut.sol";

contract Valut {

    ERC20ForValut public immutable token;

    uint public totalSupply;

    mapping(address => uint) public balanceOf;

    constructor(address _token){
        token = ERC20ForValut(_token);
    }

    function deposit(uint amount) external {
        
    uint shares = totalSupply == 0 ? amount : (amount * totalSupply) / token.balanceOf(address(this));

    (bool success) = token.transferFrom(msg.sender, address(this), amount);

    totalSupply += shares;

    balanceOf[msg.sender] += shares;
    }

    function withdraw(uint shares) external {

    uint amount = shares * token.balanceOf(address(this)) / totalSupply;

    require(token.transfer(msg.sender, amount), "Transfer failed");
    
    totalSupply -= shares;
    
    balanceOf[msg.sender] -= shares;
}
}
