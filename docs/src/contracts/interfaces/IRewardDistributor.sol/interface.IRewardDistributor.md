# IRewardDistributor
[Git Source](https://github.com/redacted-cartel/hidden-hand-contracts/blob/0eba12837f1598e3ade9a3211813a72a1e056947/contracts/interfaces/IRewardDistributor.sol)


## Functions
### updateRewardsMetadata

Update rewards metadata


```solidity
function updateRewardsMetadata(Common.Distribution[] calldata distributions) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`distributions`|`Common.Distribution[]`| Distribution[] List of reward distribution details|


### setPauseState

Set the contract's pause state (ie. before taking snapshot for the harvester)


```solidity
function setPauseState(bool state) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`state`|`bool`| bool  Pause state|


### claim

Claim rewards based on the specified metadata


```solidity
function claim(Common.Claim[] calldata _claims) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_claims`|`Common.Claim[]`| Claim[] List of claim metadata|


