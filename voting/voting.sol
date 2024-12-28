//SPDX-License-Identifier: MIT License
pragma solidity 0.8.28;

// Step 1: Define the smart contract
contract SimpleVoting {
    // Step 2: Declare state variables
    address public owner; // Owner of the contract
    struct Candidate {
        // Candidate structure
        uint id;
        string name;
        uint voteCount;
    }
    mapping(uint => Candidate) public candidates; // Candidates by ID
    mapping(address => bool) public voters; // Voter eligibility
    uint public candidateCount; // Total candidates

    // Step 3: Constructor to initialize the owner
    constructor() {
        owner = msg.sender;
    }

    // Step 4: Modifier for owner-only access
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    // Step 5: Function to register candidates
    function registerCandidate(string memory _name) public onlyOwner {
        candidateCount++;
        candidates[candidateCount] = Candidate(candidateCount, _name, 0);
    }

    // Step 6: Function to register voters
    function registerVoter(address _voter) public onlyOwner {
        voters[_voter] = true;
    }

    // Step 7: Function to vote
    function vote(uint _candidateId) public {
        require(voters[msg.sender], "You are not eligible to vote");
        require(
            _candidateId > 0 && _candidateId <= candidateCount,
            "Invalid candidate"
        );

        voters[msg.sender] = false; // Mark voter as having voted
        candidates[_candidateId].voteCount++;
    }

    // Step 8: Function to view results
    function getCandidate(uint _id) public view returns (string memory, uint) {
        Candidate memory candidate = candidates[_id];
        return (candidate.name, candidate.voteCount);
    }
}
