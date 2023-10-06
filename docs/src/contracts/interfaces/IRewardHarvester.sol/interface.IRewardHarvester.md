# IRewardHarvester
[Git Source](https://github.com/redacted-cartel/hidden-hand-contracts/blob/0eba12837f1598e3ade9a3211813a72a1e056947/contracts/interfaces/IRewardHarvester.sol)


## Functions
### defaultToken

Return the default token address


```solidity
function defaultToken() external view returns (address);
```

### depositReward

Deposit `defaultToken` to this contract


```solidity
function depositReward(uint256 _amount) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_amount`|`uint256`| uint256  Amount of `defaultToken` to deposit|


