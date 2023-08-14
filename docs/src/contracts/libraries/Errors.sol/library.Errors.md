# Errors

## Errors
### InvalidMaxPeriod
max period 0 or greater than MAX_PERIODS


```solidity
error InvalidMaxPeriod();
```

### InvalidPeriodDuration
period duration 0 or greater than MAX_PERIOD_DURATION


```solidity
error InvalidPeriodDuration();
```

### NotAContract
address provided is not a contract


```solidity
error NotAContract();
```

### NotAuthorized
not authorized


```solidity
error NotAuthorized();
```

### AlreadyInitialized
contract already initialized


```solidity
error AlreadyInitialized();
```

### InvalidAddress
address(0)


```solidity
error InvalidAddress();
```

### InvalidIdentifier
empty bytes identifier


```solidity
error InvalidIdentifier();
```

### InvalidProtocol
invalid protocol name


```solidity
error InvalidProtocol();
```

### InvalidChoiceCount
invalid number of choices


```solidity
error InvalidChoiceCount();
```

### InvalidAmount
invalid input amount


```solidity
error InvalidAmount();
```

### NotTeamMember
not team member


```solidity
error NotTeamMember();
```

### NoWhitelistBribeVault
cannot whitelist BRIBE_VAULT


```solidity
error NoWhitelistBribeVault();
```

### TokenWhitelisted
token already whitelisted


```solidity
error TokenWhitelisted();
```

### TokenNotWhitelisted
token not whitelisted


```solidity
error TokenNotWhitelisted();
```

### VoterBlacklisted
voter already blacklisted


```solidity
error VoterBlacklisted();
```

### VoterNotBlacklisted
voter not blacklisted


```solidity
error VoterNotBlacklisted();
```

### DeadlinePassed
deadline has passed


```solidity
error DeadlinePassed();
```

### InvalidPeriod
invalid period


```solidity
error InvalidPeriod();
```

### InvalidDeadline
invalid deadline


```solidity
error InvalidDeadline();
```

### InvalidMaxFee
invalid max fee


```solidity
error InvalidMaxFee();
```

### InvalidFee
invalid fee


```solidity
error InvalidFee();
```

### InvalidFeeRecipient
invalid fee recipient


```solidity
error InvalidFeeRecipient();
```

### InvalidDistributor
invalid distributor


```solidity
error InvalidDistributor();
```

### InvalidBriber
invalid briber


```solidity
error InvalidBriber();
```

### NotDepositor
address does not have DEPOSITOR_ROLE


```solidity
error NotDepositor();
```

### InvalidArray
no array given


```solidity
error InvalidArray();
```

### InvalidRewardIdentifier
invalid reward identifier


```solidity
error InvalidRewardIdentifier();
```

### BribeAlreadyTransferred
bribe has already been transferred


```solidity
error BribeAlreadyTransferred();
```

### InvalidDistribution
distribution does not exist


```solidity
error InvalidDistribution();
```

### InvalidMerkleRoot
invalid merkle root


```solidity
error InvalidMerkleRoot();
```

### InvalidToken
token is address(0)


```solidity
error InvalidToken();
```

### InvalidClaim
claim does not exist


```solidity
error InvalidClaim();
```

### RewardInactive
reward is not yet active for claiming


```solidity
error RewardInactive();
```

### InvalidTimerDuration
timer duration is invalid


```solidity
error InvalidTimerDuration();
```

### InvalidProof
merkle proof is invalid


```solidity
error InvalidProof();
```

### ETHTransferFailed
ETH transfer failed


```solidity
error ETHTransferFailed();
```

### InvalidOperator
Invalid operator address


```solidity
error InvalidOperator();
```

### TokenTransferProxyCall
call to TokenTransferProxy contract


```solidity
error TokenTransferProxyCall();
```

### TransferFromCall
calling TransferFrom


```solidity
error TransferFromCall();
```

### ExternalCallFailure
external call failed


```solidity
error ExternalCallFailure();
```

### InsufficientReturn
returned tokens too few


```solidity
error InsufficientReturn();
```

### DeadlineBreach
swapDeadline expired


```solidity
error DeadlineBreach();
```

### ZeroExpectedReturns
expected tokens returned are 0


```solidity
error ZeroExpectedReturns();
```

### ExchangeDataArrayMismatch
arrays in SwapData.exchangeData have wrong lengths


```solidity
error ExchangeDataArrayMismatch();
```

