# BribeFactory
[Git Source](https://github.com/redacted-cartel/hidden-hand-contracts/blob/0eba12837f1598e3ade9a3211813a72a1e056947/contracts/BribeFactory.sol)

**Inherits:**
Ownable2Step


## State Variables
### bribeMarketImplementation

```solidity
address public bribeMarketImplementation;
```


### bribeVault

```solidity
address public bribeVault;
```


### MAX_PERIODS

```solidity
uint256 public constant MAX_PERIODS = 10;
```


### MAX_PERIOD_DURATION

```solidity
uint256 public constant MAX_PERIOD_DURATION = 30 days;
```


## Functions
### isContract

Check if the specified address is a contract


```solidity
modifier isContract(address _address);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_address`|`address`| Address to be checked|


### constructor


```solidity
constructor(address _implementation, address _bribeVault);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_implementation`|`address`| Address of the implementation contract|
|`_bribeVault`|`address`|     Address of the bribe vault|


### createBribeMarket

Deploy a new bribe market


```solidity
function createBribeMarket(string calldata _protocol, uint256 _maxPeriods, uint256 _periodDuration)
    external
    returns (address);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_protocol`|`string`|       address  Market name/identifier|
|`_maxPeriods`|`uint256`|     uint256  Maximum number of periods for bribe deposits|
|`_periodDuration`|`uint256`| uint256  Period duration in each voting round|


### setBribeMarketImplementation

Set the bribe market implementation address


```solidity
function setBribeMarketImplementation(address _implementation) external onlyOwner;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_implementation`|`address`| address  Implementation address|


### setBribeVault

Set the bribe vault address


```solidity
function setBribeVault(address _bribeVault) external onlyOwner;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_bribeVault`|`address`| address  Bribe vault address|


### _setBribeMarketImplementation

Internal method to set the bribe market implementation address


```solidity
function _setBribeMarketImplementation(address _implementation) internal isContract(_implementation);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_implementation`|`address`| address  Implementation address|


### _setBribeVault

Internal method to set the bribe vault address


```solidity
function _setBribeVault(address _bribeVault) internal isContract(_bribeVault);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_bribeVault`|`address`| address  Bribe vault address|


## Events
### BribeMarketCreated

```solidity
event BribeMarketCreated(address indexed bribeMarket);
```

### BribeMarketImplementationUpdated

```solidity
event BribeMarketImplementationUpdated(address indexed bribeMarketImplementation);
```

### BribeVaultUpdated

```solidity
event BribeVaultUpdated(address indexed bribeVault);
```

