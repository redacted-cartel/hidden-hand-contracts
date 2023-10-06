# VaultOperator
[Git Source](https://github.com/redacted-cartel/hidden-hand-contracts/blob/0eba12837f1598e3ade9a3211813a72a1e056947/contracts/VaultOperator.sol)

**Inherits:**
Ownable2Step


## State Variables
### bribeVault

```solidity
IBribeVault public immutable bribeVault;
```


### rewardDistributor

```solidity
IRewardDistributor public immutable rewardDistributor;
```


### operator

```solidity
address public operator;
```


## Functions
### constructor


```solidity
constructor(address _bribeVault, address _rewardDistributor);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_bribeVault`|`address`|        Address of the bribe vault|
|`_rewardDistributor`|`address`| Address of the reward distributor|


### onlyOperator


```solidity
modifier onlyOperator();
```

### setOperator

Set the operator


```solidity
function setOperator(address _operator) external onlyOwner;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_operator`|`address`| address  Operator address|


### transferBribes

Redirect transferBribes call to the bribeVault for approved operator


```solidity
function transferBribes(bytes32[] calldata rewardIdentifiers) external onlyOperator;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`rewardIdentifiers`|`bytes32[]`| bytes32[]  List of rewardIdentifiers|


### updateRewardsMetadata

Redirect updateRewardsMetadata call to the rewardDistributor for approved operator


```solidity
function updateRewardsMetadata(Common.Distribution[] calldata distributions) external onlyOperator;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`distributions`|`Common.Distribution[]`| Distribution[]  List of reward distribution details|


### setPauseState

Set pause state on the rewardDistributor for approved operator


```solidity
function setPauseState(bool state) external onlyOperator;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`state`|`bool`| bool  Pause state|


## Events
### SetOperator

```solidity
event SetOperator(address indexed operator);
```

