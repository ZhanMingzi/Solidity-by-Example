// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

interface IERC721 {

    function transferFrom(address _from, address _to ,uint nftId) external ;
    
}

contract EnglishAuction{

    IERC721 public immutable nft;
    uint public immutable nftId;

    address payable public immutable seller;
    uint32 public endAt;
    bool public started;
    bool public ended;

    address public highestBidder;
    uint public highestBid;
    mapping(address => uint) public bids;

    constructor(
        address _nft,
        uint _nftId,
        uint _startingBid
    ){
        nft = IERC721(_nft);
        nftId = _nftId;
        seller = payable(msg.sender);
        highestBid = _startingBid;
    }

    function start() external {
        started = true;
        endAt = uint32(block.timestamp + 600);

        nft.transferFrom(seller, address(this), nftId);

        //emit Start();
    }

    function bid() external payable{
        require(started,"not start");
        require(block.timestamp < endAt,"auction ended");
        
        require(msg.value>highestBid,"value < hisghestBid");

        if(highestBidder != address(0)){
            bids[highestBidder] += highestBid;
        }
        

        highestBid = msg.value;
        highestBidder = msg.sender;

        //emit Bid();
        }

    function withdraw() external {
        uint bal = bids[msg.sender];
        bids[msg.sender] = 0;

        payable (msg.sender).transfer(bal);
    }

    function end() external {

        require(started,"not started");

        require(!ended,"ended");

        require(endAt<=block.timestamp,"not ended");
//495512
//438355
        ended = true;

        if(msg.sender == highestBidder && highestBidder != address(0)){

        nft.transferFrom(address(this), msg.sender, nftId);
        seller.transfer(highestBid);
        }
        else {
            nft.transferFrom(address(this), seller, nftId);
        }
    }
}