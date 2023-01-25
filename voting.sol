
pragma solidity >=0.7.0 <0.9.0;

contract Voting{
    address admin;
    constructor(){
        admin = msg.sender;
    }
    // the list of the candidates
    bytes32[] public CandidateList;

    // mapping of votes i.e. for each candidate it will count the no. of votes
    mapping (bytes32 => uint8) public votesReceived;

    modifier isAdmin
    {
        require(admin == msg.sender);
        _;
    }
    // constructor to pass the an array of candidates
    function getter(bytes32[] memory candidateNames) public isAdmin{
    CandidateList = candidateNames;
    }

    // function to vote for the candidates
    function voteForCandidate(bytes32 candidate) public{
    votesReceived[candidate] += 1;
    }


    // this function returns the total no. of votes of the cadidates
    function totalVotesFor(bytes32 candidate)public returns (uint8) {
    return votesReceived[candidate];
    }
}
