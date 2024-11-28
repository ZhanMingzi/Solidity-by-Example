// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract ERC20ForValut is ERC20 {

      constructor() ERC20 ("Wrapped Ether", "WETH"){
        _mint(msg.sender, 1000);
      }

    function mint(address _account, uint256 _value) external{
        _mint(_account, _value);
    }
}