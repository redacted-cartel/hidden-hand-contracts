# Common

## Structs
### Distribution

```solidity
struct Distribution {
    bytes32 identifier;
    address token;
    bytes32 merkleRoot;
    bytes32 proof;
}
```

### DepositBribeParams

```solidity
struct DepositBribeParams {
    bytes32 proposal;
    address token;
    address briber;
    uint256 amount;
    uint256 maxTokensPerVote;
    uint256 periods;
    uint256 periodDuration;
    uint256 proposalDeadline;
    uint256 permitDeadline;
    bytes signature;
}
```

### ClaimAndSwapData

```solidity
struct ClaimAndSwapData {
    bytes32 rwIdentifier;
    address fromToken;
    address toToken;
    uint256 fromAmount;
    uint256 toAmount;
    uint256 deadline;
    address[] callees;
    uint256[] callLengths;
    uint256[] values;
    bytes exchangeData;
    bytes32[] rwMerkleProof;
}
```

### Claim

```solidity
struct Claim {
    bytes32 identifier;
    address account;
    uint256 amount;
    bytes32[] merkleProof;
}
```

