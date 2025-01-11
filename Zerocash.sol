// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";

contract Zerocash {
    struct Coin {
        bytes32 commitment;
        bool spent;
    }

    mapping(bytes32 => Coin) public coins;
    mapping(bytes32 => bool) public nullifiers;
    bytes32 public merkleRoot;

    event Mint(bytes32 indexed commitment, bytes32 indexed leafHash);
    event Spend(bytes32 indexed nullifier, bytes32 indexed newCommitment);

    // Mint function: Adds a new commitment to the system
    function mint(bytes32 _commitment, bytes32 _leafHash) external {
        require(coins[_commitment].commitment == 0, "Coin already exists.");

        coins[_commitment] = Coin({
            commitment: _commitment,
            spent: false
        });

        emit Mint(_commitment, _leafHash);
    }

    // Spend function: Verifies and spends an existing coin
    function spend(
        bytes32 _nullifier,
        bytes32 _newCommitment,
        bytes32[] calldata _merkleProof
    ) external {
        require(!nullifiers[_nullifier], "Nullifier already spent.");

        // Verify Merkle proof
        bytes32 leafHash = keccak256(abi.encodePacked(_nullifier));
        require(
            MerkleProof.verify(_merkleProof, merkleRoot, leafHash),
            "Invalid Merkle proof."
        );

        nullifiers[_nullifier] = true;
        coins[_newCommitment] = Coin({
            commitment: _newCommitment,
            spent: false
        });

        emit Spend(_nullifier, _newCommitment);
    }

    // Function to update the Merkle root
    function updateMerkleRoot(bytes32 _newRoot) external {
        merkleRoot = _newRoot;
    }
}
