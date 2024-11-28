// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

interface IERC721 {

     function transferFrom(address from, address to, uint256 id) external;
    
}

contract DutchAuction {

    uint private constant Duration = 7 days;

    IERC721 public immutable nft;

    uint public immutable nftId;

    address public immutable seller;
    uint public immutable startingPrice;
    uint public immutable startAt;
    uint public immutable expireAt;
    uint public immutable discountRate;

    constructor(
        uint _startingPrice,
        uint _discountRate,
        address _nft,
        uint _nftId

    ){
        seller = payable (msg.sender);
        startingPrice = _startingPrice;
        discountRate = _discountRate;
        startAt = block.timestamp;
        expireAt = block.timestamp + Duration;

        nft = IERC721(_nft);

        nftId = _nftId;

    }

    function getPrice() public view returns(uint){
        uint timeElapsed = block.timestamp - startAt;

        uint CurrentPrice = startingPrice - (timeElapsed*discountRate);

        return CurrentPrice;

    }

    function buy() external payable {

        require(block.timestamp<expireAt,"Auction Expired");

        uint CurrentPrice = getPrice();

        //transfer action
        require(msg.value>=CurrentPrice,"ETH < Price");
        
        nft.transferFrom(seller, msg.sender, nftId);

        

        uint refund = msg.value - CurrentPrice;

        if(refund>0)
        {
            payable(msg.sender).transfer(refund);
        }





    }


}
//0x406AB5033423Dcb6391Ac9eEEad73294FA82Cfbc