// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract counter {
    uint public count;

    function increase() external {
        count += 1;
    }

    function decreae()external {
        count -= 1;
    }
}