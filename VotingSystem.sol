// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingSystem {
    address public admin;
    bool public votingStarted = false;
    bool public votingEnded = false;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this action");
        _;
    }

    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    uint public candidatesCount = 0;
    mapping(uint => Candidate) public candidates;
    mapping(address => bool) public hasVoted;

    // Add a candidate (only before voting starts)
    function addCandidate(string memory _name) public onlyAdmin {
        require(!votingStarted, "Cannot add candidates after voting starts");
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    // Start the voting (admin only)
    function startVoting() public onlyAdmin {
        require(!votingStarted, "Voting already started");
        votingStarted = true;
    }

    // End the voting (admin only)
    function endVoting() public onlyAdmin {
        require(votingStarted, "Voting has not started yet");
        require(!votingEnded, "Voting already ended");
        votingEnded = true;
    }

    // Vote for a candidate by ID
    function vote(uint _candidateId) public {
        require(votingStarted, "Voting has not started");
        require(!votingEnded, "Voting has ended");
        require(!hasVoted[msg.sender], "You have already voted");
        require(_candidateId > 0 && _candidateId <= candidatesCount, "Invalid candidate ID");

        candidates[_candidateId].voteCount++;
        hasVoted[msg.sender] = true;
    }

    // Get the name of the winner after voting ends
    function getWinner() public view returns (string memory winnerName) {
        require(votingEnded, "Voting is not ended yet");

        uint maxVotes = 0;
        uint winnerId = 0;
        uint countMaxVoteCandidates = 0;

        // First, find maxVotes
        for (uint i = 1; i <= candidatesCount; i++) {
            if (candidates[i].voteCount > maxVotes) {
                maxVotes = candidates[i].voteCount;
            }
        }

        // Count how many candidates have maxVotes
        for (uint i = 1; i <= candidatesCount; i++) {
            if (candidates[i].voteCount == maxVotes) {
                countMaxVoteCandidates++;
                winnerId = i; // Store last candidate with maxVotes (will be used only if there's one)
            }
        }

        if (countMaxVoteCandidates > 1) {
            return "Vote is Draw";
        } else {
            return candidates[winnerId].name;
        }
    }

    // View total votes for a specific candidate
    function getVoteCount(uint _candidateId) public view returns (uint) {
        require(_candidateId > 0 && _candidateId <= candidatesCount, "Invalid candidate ID");
        return candidates[_candidateId].voteCount;
    }
}
