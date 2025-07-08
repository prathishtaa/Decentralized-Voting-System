# Decentralized Voting System

This is a smart contract-based voting system developed using Solidity and deployed on the Ethereum blockchain via Remix IDE. The project ensures a secure, transparent, and tamper-proof election process without the need for any centralized authority.

## Features

- Role-based access control (Admin and Voter)
- Admin-controlled candidate and voter registration
- One-person-one-vote enforcement
- Real-time vote counting and winner declaration
- Immutable data stored on-chain
- Fully functional without a frontend interface or MetaMask

## Tech Stack

- Solidity
- Ethereum Blockchain
- Remix IDE (JavaScript VM)

## Smart Contract Functions

Admin Functions:
- addCandidate(string name): Add a new candidate
- registerVoter(address voter): Register a voter's address
- startVoting(): Start the voting session
- endVoting(): End the voting session

Voter Function:
- vote(uint candidateId): Cast a vote

Public Functions:
- getResults(): View total votes per candidate
- getWinner(): Get the candidate with the highest votes

## How to Run (Using Remix IDE)

1. Open remix.ethereum.org
2. Create a new file named VotingSystem.sol
3. Paste the contract code into the editor
4. Compile the code using the Solidity compiler
5. Deploy the contract using the JavaScript VM environment
6. Use the deployed contract interface to add candidates, register voters, start and end voting, and check results

## Notes

- This project does not include a frontend or UI.
- Designed for academic and demonstration purposes.
- Can be extended into a full DApp using Web3.js or similar tools.

## License

This project is open-source and available under the MIT License.

## Author

Prathishta Jain  
Artificial Intelligence and Data Science Student
