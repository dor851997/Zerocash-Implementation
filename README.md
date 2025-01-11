# Zerocash Smart Contract

Zerocash is a Solidity-based smart contract designed to implement anonymous digital payments using cryptographic commitments and zk-SNARKs. This repository contains the contract, test scripts, and example transactions to interact with the Zerocash system.

## Features
- **Mint**: Create new private coins by submitting commitments.
- **Spend**: Spend existing coins by proving validity and generating new commitments.
- **Update Merkle Root**: Maintain the Merkle tree's root to ensure transaction validity.

## Project Structure
```
zerocash/
├── contracts/
│   └── Zerocash.sol          # Main smart contract
├── scripts/
│   └── exampleTransactions.js  # Example scripts for Remix
├── test/
│   └── Zerocash.test.js       # Hardhat test scripts
├── README.md                  # Project documentation
├── package.json               # Project dependencies
└── hardhat.config.js          # Hardhat configuration
```

## Prerequisites
1. **Node.js**: Install the latest LTS version from [Node.js](https://nodejs.org/).
2. **Hardhat**: Install using:
   ```bash
   npm install --save-dev hardhat
   ```
3. **Remix IDE**: Access [Remix](https://remix.ethereum.org) for contract testing in a browser.
4. **Ethers.js**: Ensure `ethers.js` is available for JavaScript interaction.

## Deployment Steps (Hardhat)
1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd zerocash
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Compile the contract:
   ```bash
   npx hardhat compile
   ```
4. Deploy the contract:
   ```bash
   npx hardhat run scripts/deploy.js --network localhost
   ```

## Testing

### Hardhat Test
1. Run test cases:
   ```bash
   npx hardhat test
   ```
2. Sample test results:
   - Mint a coin: Verified by checking event logs and mapping entries.
   - Spend a coin: Verified nullifier status and creation of new commitment.
   - Update Merkle Root: Verified root change with `merkleRoot()`.

### Remix IDE Test
1. Deploy the contract in Remix IDE.
2. Use the provided example transaction scripts in the `scripts/` folder:
   - `mintCoin()`: Mint a new coin.
   - `updateMerkleRoot()`: Update the Merkle root.
   - `spendCoin()`: Spend a coin and generate a new one.

## Example Transactions
### Mint a Coin
```javascript
const commitment = ethers.utils.formatBytes32String("commitment1");
const leafHash = ethers.utils.formatBytes32String("leafHash1");
await zerocash.mint(commitment, leafHash);
```

### Update Merkle Root
```javascript
const newRoot = ethers.utils.formatBytes32String("newMerkleRoot");
await zerocash.updateMerkleRoot(newRoot);
```

### Spend a Coin
```javascript
const nullifier = ethers.utils.formatBytes32String("nullifier1");
const newCommitment = ethers.utils.formatBytes32String("newCommitment1");
const merkleProof = [];
await zerocash.spend(nullifier, newCommitment, merkleProof);
```

## Notes
- **Gas Optimization**: Ensure efficient use of gas by reviewing proof sizes and Merkle operations.
- **Security**: The contract does not yet include zk-SNARK integration. Future versions will include zk-SNARK proof validation for additional privacy.

## Future Work
- Integration of zk-SNARKs for enhanced privacy.
- Deployment to testnets such as Polygon Mumbai for real-world validation.
- Development of a user-friendly wallet interface.

## Contributions
Feel free to open issues or submit pull requests to improve this project.

---

### License
This project is licensed under the MIT License. See the LICENSE file for details.

