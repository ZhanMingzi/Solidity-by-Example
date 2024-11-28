// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

//import "/contracts/ERC20.sol";

contract WETH is ERC20 {

event Deposit(address _addr,uint _amount);

event Withdraw(address _addr,uint _amount);

constructor() ERC20("Wrapped ETH","WETH") {

}

fallback() external payable { 
    deposit();
}

function deposit() public  payable   {

    _mint(msg.sender, msg.value);
    emit Deposit(msg.sender, msg.value);

}

function withdraw(uint _amount)external{

   _burn(msg.sender, _amount);
   payable(msg.sender).transfer(_amount);
   emit Withdraw(msg.sender, _amount);
}


}