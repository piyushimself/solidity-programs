//SPDX-License-Identifier: MIT License
pragma solidity 0.8.28;

// Define the smart contract
contract SimpleVoting {
    //  Declare state variables
    address public owner; // Owner of the contract
    struct Candidate {
        // Candidate
        uint id;
        string name;
        uint voteCount;
    }
    mapping(uint => Candidate) public candidates; // Candidates by ID
    mapping(address => bool) public voters; // Voter eligibility
    uint public candidateCount; // Total candidates

    //  Constructor to initialize the owner
    constructor() {
        owner = msg.sender;
    }

    // Modifier for owner-only access
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    //  Function to register candidates
    function registerCandidate(string memory _name) public onlyOwner {
        candidateCount++;
        candidates[candidateCount] = Candidate(candidateCount, _name, 0);
    }

    //  Function to register voters
    function registerVoter(address _voter) public onlyOwner {
        voters[_voter] = true;
    }

    // Function to vote
    function vote(uint _candidateId) public {
        require(voters[msg.sender], "You are not eligible to vote");
        require(
            _candidateId > 0 && _candidateId <= candidateCount,
            "Invalid candidate"
        );

        voters[msg.sender] = false; // Mark voter as having voted
        candidates[_candidateId].voteCount++;
    }

    // Function to view results
    function getCandidate(uint _id) public view returns (string memory, uint) {
        Candidate memory candidate = candidates[_id];
        return (candidate.name, candidate.voteCount);
    }
}
