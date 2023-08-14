# RewardSwapper
**Inherits:**
Ownable2Step


## State Variables
### rewardDistributor

```solidity
IRewardDistributor public rewardDistributor;
```


### rewardHarvester

```solidity
IRewardHarvester public rewardHarvester;
```


### operator

```solidity
address public operator;
```


## Functions
### onlyOperator

Modifier to check caller is operator


```solidity
modifier onlyOperator();
```

### constructor


```solidity
constructor(address _rewardDistributor, address _rewardHarvester, address _operator);
```

### claimSwapAndDepositReward

Executes swaps via DEX


```solidity
function claimSwapAndDepositReward(Common.ClaimAndSwapData[] calldata _claimSwapData) external onlyOperator;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_claimSwapData`|`Common.ClaimAndSwapData[]`| Common.ClaimAndSwapData[]  The data for the claims+swaps|


### changeOperator

Change the operator


```solidity
function changeOperator(address _operator) external onlyOwner;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_operator`|`address`| address  New operator address|


### changeRewardHarvester

Change the reward harvester address


```solidity
function changeRewardHarvester(address _harvester) external onlyOwner;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_harvester`|`address`| address  New harvester address|


### changeRewardDistributor

Change the reward distributor address


```solidity
function changeRewardDistributor(address _distributor) external onlyOwner;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_distributor`|`address`| address  New distributor address|


### _setOperator

*Internal to set the operator*


```solidity
function _setOperator(address _operator) internal;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_operator`|`address`| address  Operator address|


### _setRewardHarvester

*Internal to set the reward harvester*


```solidity
function _setRewardHarvester(address _harvester) internal;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_harvester`|`address`| address  Reward Harvester address|


### _setRewardDistributor

*Internal to set the reward distributor*


```solidity
function _setRewardDistributor(address _distributor) internal;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_distributor`|`address`| address  Distributor address|


### _swap

Executes a sequence of swaps via DEX


```solidity
function _swap(Common.ClaimAndSwapData memory _swapData) internal returns (uint256 receivedAmount);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_swapData`|`Common.ClaimAndSwapData`|      Common.SwapData  The data for the swaps|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`receivedAmount`|`uint256`| uint256          The final amount of the toToken received|


### _externalCall

*Source take from GNOSIS MultiSigWallet*

*https://github.com/gnosis/MultiSigWallet/blob/master/contracts/MultiSigWallet.sol*


```solidity
function _externalCall(
    address _destination,
    uint256 _value,
    uint256 _dataOffset,
    uint256 _dataLength,
    bytes memory _data
) internal returns (bool);
```

## Events
### SetOperator

```solidity
event SetOperator(address indexed operator);
```

### SetRewardHarvester

```solidity
event SetRewardHarvester(address indexed rewardHarvester);
```

### SetRewardDistributor

```solidity
event SetRewardDistributor(address indexed rewardDistributor);
```

### BribeTransferred

```solidity
event BribeTransferred(address indexed token, uint256 totalAmount);
```

