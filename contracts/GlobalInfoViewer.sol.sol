// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract GlobalInfoViewer {

    function viewGlobalInfo() external view returns (address,uint,uint){
       address callAddress = msg.sender;
       uint mytimestamp = block.timestamp;
       uint myBlock = block.number;

       return(callAddress,mytimestamp,myBlock);

    }
}

