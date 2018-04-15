// what is address, uint, struct, modifier restricted(), _;, payable
// what are the available properties of msg. 
// when you store something, you have to use 'sotrage', 'memory' keyword
// you can also use 'memory' keyword. when you use 'storage' you are referencing
// original. otherwise you are referencing a copy of the original

pragma solidity ^0.4.17;

// for deploying each campaign
// user deploying the campaign will pay for it
contract CampaignFactory {
    address[] public deployedCampaigns;

    // create a campaign
    function createCampaign(uint minimum) public {
        // need to pass the msg.sender to Campaign so we know which user created the campaign
        address newCampaign = new Campaign(minimum, msg.sender);
        deployedCampaigns.push(newCampaign);
    }
    // get a list of all deployed campaigns
    function getDeployedCampaigns() public view returns (address[]) {
        return deployedCampaigns;
    }
}

contract Campaign {
    struct Request {
        string description;
        uint value;
        address recipient; // rec. of the ethereum. i.e. vendor
        bool complete;  // if voting has been complete
        uint approvalCount;
        mapping(address => bool) approvals;
    }

    Request[] public requests;
    address public manager;
    uint public minimumContribution;
    mapping(address => bool) public approvers;
    uint public approversCount;

    modifier restricted() {
        require(msg.sender == manager);
        _;
    }

    // constructor function
    function Campaign(uint minimum, address creator) public {
        manager = creator;
        minimumContribution = minimum;
    }

    function contribute() public payable {
        require(msg.value > minimumContribution);
        // the user contributing is added to a list of approvers
        approvers[msg.sender] = true;
        approversCount++;
    }

    // the manager can create a request to fund a recepeient with certain amount of ether (value)
    function createRequest(string description, uint value, address recipient) public restricted {
        Request memory newRequest = Request({
           description: description,
           value: value,
           recipient: recipient,
           complete: false,
           approvalCount: 0
        });

        requests.push(newRequest);
    }

    // the contributor/approver can vote to approve the request
    function approveRequest(uint index) public {
        Request storage request = requests[index];

        // make sure that only approver can approve request
        require(approvers[msg.sender]);
        // if person already voted on a request, prevent them from voting again
        require(!request.approvals[msg.sender]);

         // mark a contibutor that he already approved the request so s/he cannot approve again
        request.approvals[msg.sender] = true;
        request.approvalCount++; // keep track of tototal number of approvers
    }

    // once we get enough votes, manager can send the ether value to intended recipient
    function finalizeRequest(uint index) public restricted {
        Request storage request = requests[index];

        // to finalize, need at least 50% of approvers (approversCount) to approve
        require(request.approvalCount > (approversCount / 2));
        // make sure if request is complete, you cannot finalize it again
        require(!request.complete);

        request.recipient.transfer(request.value);
        request.complete = true;
    }

    // get summar of specific campaign
    function getSummary() public view returns (
      uint, uint, uint, uint, address
      ) {
        return (
          minimumContribution,
          this.balance,
          requests.length,
          approversCount,
          manager
        );
    }

    function getRequestsCount() public view returns (uint) {
        return requests.length;
    }
}
