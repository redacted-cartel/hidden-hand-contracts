# SwapperMock
**Inherits:**
[RewardSwapper](/contracts/RewardSwapper.sol/contract.RewardSwapper.md)


## Functions
### constructor


```solidity
constructor(address _rewardDistributor, address _rewardHarvester, address _operator)
    RewardSwapper(_rewardDistributor, _rewardHarvester, _operator);
```

### swap


```solidity
function swap(Common.ClaimAndSwapData memory _swapData) external returns (uint256 receivedAmount);
```

