# Zerocash Smart Contract

Zerocash is a Solidity-based smart contract designed to implement anonymous digital payments using cryptographic commitments and zk-SNARKs. This repository contains the contract and test scripts to interact with the Zerocash system using Remix.

## Features
- **Mint**: Create new private coins by submitting commitments.
- **Spend**: Spend existing coins by proving validity and generating new commitments.
- **Update Merkle Root**: Maintain the Merkle tree's root to ensure transaction validity.

## Repository Structure
```
zerocash/
├── LICENSE                   # License information
├── README.md                 # Project documentation
├── Zerocash.sol              # Main smart contract
├── Zerocash Test Scripts     # Test scripts for Remix IDE
```

## Prerequisites
1. **Remix IDE**: Access [Remix](https://remix.ethereum.org) for contract deployment and testing.
2. **Ethers.js**: Ensure `ethers.js` is available for JavaScript interaction if using the console.

## Deployment Steps (Remix)
1. Open [Remix](https://remix.ethereum.org).
2. Create a new file named `Zerocash.sol` and paste the contract code.
3. Compile the contract using the Solidity compiler.
4. Deploy the contract in the Remix VM environment or a connected network.

## Testing in Remix

### Using the Remix Interface
1. **Mint a Coin**:
   - Use the `mint` function with:
     - `_commitment`: A unique 32-byte hex value (e.g., `0x123456789abcdef123456789abcdef123456789abcdef123456789abcdef1234`).
     - `_leafHash`: A unique 32-byte hex value (e.g., `0x56789abcdef123456789abcdef123456789abcdef123456789abcdef12345678`).
   - Verify the `Mint` event is emitted and the coin is added.

2. **Update Merkle Root**:
   - Use the `updateMerkleRoot` function with:
     - `_newRoot`: A unique 32-byte hex value (e.g., `0x9999999999999999999999999999999999999999999999999999999999999999`).
   - Verify the `merkleRoot` function reflects the updated root.

3. **Spend a Coin**:
   - Use the `spend` function with:
     - `_nullifier`: A unique 32-byte hex value for the coin being spent.
     - `_newCommitment`: A unique 32-byte hex value for the new coin.
     - `_merkleProof`: An empty array (`[]`) for this example.
   - Verify the `Spend` event is emitted and the nullifier is marked as spent.

### Using Test Scripts in Remix
1. Create a new JavaScript file and paste the `Zerocash Test Scripts` code.
2. Replace `<DEPLOYED_CONTRACT_ADDRESS>` with the deployed contract address.
3. Run the script using the Remix console or right-click the file and select **Run**.
4. Observe the output in the Remix terminal for transaction details and confirmations.

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

