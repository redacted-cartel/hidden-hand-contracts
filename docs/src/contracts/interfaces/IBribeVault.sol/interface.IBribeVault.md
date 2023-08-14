# IBribeVault

## Functions
### depositBribe

Deposit bribe (ERC20 only)


```solidity
function depositBribe(Common.DepositBribeParams calldata _depositParams) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_depositParams`|`Common.DepositBribeParams`| DepositBribeParams  Deposit data|


### getBribe

Get bribe information based on the specified identifier


```solidity
function getBribe(bytes32 _bribeIdentifier) external view returns (address token, uint256 amount);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_bribeIdentifier`|`bytes32`| bytes32  The specified bribe identifier|


### transferBribes

Transfer fees to fee recipient and bribes to distributor and update rewards metadata


```solidity
function transferBribes(bytes32[] calldata _rewardIdentifiers) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_rewardIdentifiers`|`bytes32[]`| bytes32[]  List of rewardIdentifiers|


### grantDepositorRole

Grant the depositor role to an address


```solidity
function grantDepositorRole(address _depositor) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_depositor`|`address`| address  Address to grant the depositor role|


