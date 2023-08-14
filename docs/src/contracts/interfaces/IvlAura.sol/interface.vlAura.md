# vlAura

## Functions
### delegates

Delegate of the specified account


```solidity
function delegates(address account) external view returns (address);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`account`|`address`| address  Account|


### balanceOf

Balance of the specified user


```solidity
function balanceOf(address user) external view returns (uint256 amount);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`user`|`address`| address  User account|


### getVotes

*Gets the current votes balance for `account`*


```solidity
function getVotes(address account) external view returns (uint256);
```

## Events
### DelegateChanged

```solidity
event DelegateChanged(address indexed delegator, address indexed fromDelegate, address indexed toDelegate);
```

