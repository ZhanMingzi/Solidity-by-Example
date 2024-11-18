// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/interfaces/IERC20.sol";

contract CSAM{

IERC20 public immutable token1;
IERC20 public immutable token0;

uint public reserve0;
uint public reserve1;

uint public totalSupply;

mapping(address => uint) balanceOf;

constructor(address _token0,address _token1){
    token0 = IERC20(_token0);
    token1 = IERC20(_token1);
}

function _mint(address _to,uint _amount) private {

    balanceOf[_to] += _amount;
    totalSupply += _amount;
}

function _burn(address _from,uint _amount) private {
    balanceOf[_from] -= _amount;
    totalSupply -= _amount;

}

function updateReserve()


function swap(address _tokenIn, uint _amountIn) external returns(uint amountOut) {
    require(
        _tokenIn == address(token0) || _tokenIn == address(token1),"Ivalid token"
    );

    uint amountIn;

    if(_tokenIn == address(token0)){
        token0.transferFrom(msg.sender, address(this), _amountIn);
        amountIn = token0.balanceOf(address(this)) - reserve0;
    }else if(_tokenIn == address(token1)){
        token1.transferFrom(msg.sender, address(this), _amountIn);
        amountIn = token0.balanceOf(address(this)) - reserve0;
    }

    amountOut = amountIn * 997 / 1000;


}

}