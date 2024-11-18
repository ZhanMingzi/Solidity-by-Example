// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//import "@openzeppelin/contracts/token/ERC20/IERC20.sol";


interface IERC20 {

    function transfer(address,uint256) external returns(bool);

    function transferFrom(address,address,uint256)external returns(bool);
    
}

contract CrowdFound{

    event Launch(uint id, address indexed creator, uint goal, uint32 startAt,uint32 endAt);
    event Cancel(uint id);
    event Pledge(uint indexed id,address indexed caller,uint amount);
    event Unpledge(uint indexed id,address indexed caller, uint amount); 
    event Claim(uint id);
    event Refund(uint id,address indexed caller,uint amount);

    IERC20 public immutable token;

    struct campaign{
        address creator;
        uint goal;
        uint pledged;
        uint32 startAt;
        uint32 endAt;
        bool claimed;
    }

    constructor(address _token){
        token = IERC20(_token);
    }

    uint public count;

    mapping(uint => campaign) public campaigns;

    mapping(uint => mapping(address => uint)) public pledgedAmount;

    function launch(
        uint _goal,
        uint32 _startAt,
        uint32 _endAt
    ) external {
        require(_startAt >=  block.timestamp,"Already Started");
        require(_endAt > _startAt,"endtime less than starttime" );
        //require();

        count+=1;

        campaigns[count] = campaign({
        creator:msg.sender,
        goal:_goal,
        pledged:0,
        startAt:_startAt,
        endAt:_endAt,
        claimed:false
        });

        emit Launch(count, msg.sender, _goal, _startAt, _endAt);
    }

    function cancel(uint _id) external{
        campaign memory tempCampaign = campaigns[_id];

        require(msg.sender == tempCampaign.creator,"not the creater");
        require(block.timestamp<tempCampaign.startAt,"already started");

        delete campaigns[_id];

        emit Cancel(_id);
    }

    function pledge(uint _id,uint _amount)external{
        campaign storage tempCampaign = campaigns[_id];

        //mapping(uint => mapping(address => uint)) public pledgedAmount;
        require(block.timestamp >= tempCampaign.startAt, "not started");
        require(block.timestamp <= tempCampaign.endAt, "ended");    



        tempCampaign.pledged += _amount;

        pledgedAmount[_id][msg.sender] += _amount;
        token.transferFrom(msg.sender,address(this) , _amount);

        emit Pledge(_id, msg.sender, _amount);



    }

    function unpledge(uint _id,uint _amount) external{
        campaign storage tempCampaign = campaigns[_id];

        require(block.timestamp <= tempCampaign.endAt, "ended");

        tempCampaign.pledged -= _amount;

        pledgedAmount[_id][msg.sender] -= _amount;
        
        token.transfer(msg.sender,_amount);

        emit Unpledge(_id, msg.sender, _amount);

    }

    function claim(uint _id)external{

        campaign storage tempCampaign = campaigns[_id];

        uint totalAmount;

        require(msg.sender == tempCampaign.creator, "not creator");
        require(block.timestamp > tempCampaign.endAt, "not ended");
        //require(campaign.pledged >= campaign.goal, "pledged < goal");
        require(!tempCampaign.claimed, "claimed");
        tempCampaign.claimed = true;

        if (tempCampaign.goal<=tempCampaign.pledged) {
            totalAmount = tempCampaign.pledged;
            tempCampaign.pledged = 0;
            token.transfer(tempCampaign.creator,totalAmount);
        }

        emit Claim(_id);


    }

    function refund(uint _id) external{

        campaign storage tempCampaign = campaigns[_id];

        require(block.timestamp > tempCampaign.endAt, "not ended");
        require(tempCampaign.pledged < tempCampaign.goal, "pledged < goal");

        tempCampaign.claimed = true;

        token.transfer(msg.sender,pledgedAmount[_id][msg.sender] );




    }

}