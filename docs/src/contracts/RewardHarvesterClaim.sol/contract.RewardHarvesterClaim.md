# RewardHarvesterClaim
[Git Source](https://github.com/redacted-cartel/hidden-hand-contracts/blob/0eba12837f1598e3ade9a3211813a72a1e056947/contracts/RewardHarvesterClaim.sol)

**Inherits:**
Ownable2Step, ReentrancyGuard


## State Variables
### MAX_FEE

```solidity
uint256 public constant MAX_FEE = 100_000;
```


### fee

```solidity
uint256 public fee;
```


### harvester

```solidity
RewardHarvester public immutable harvester;
```


## Functions
### constructor


```solidity
constructor(address _harvester, uint256 _fee);
```

### claim

Claim rewards based on the specified metadata

*Currently only perform direct claiming for this version*


```solidity
function claim(address _token, address _account, uint256 _amount, bytes32[] calldata _merkleProof)
    external
    nonReentrant;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_token`|`address`|       address    Token to claim rewards|
|`_account`|`address`|     address    Account to claim rewards|
|`_amount`|`uint256`|      uint256    Amount of rewards to claim|
|`_merkleProof`|`bytes32[]`| bytes32[]  Merkle proof of the claim|


### changeFee

Change fee


```solidity
function changeFee(uint256 _newFee) external onlyOwner;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_newFee`|`uint256`| uint256  New fee to set|


### _setFee

*Internal to set the fee*


```solidity
function _setFee(uint256 _newFee) internal;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_newFee`|`uint256`| uint256  Token address|


## Events
### SetFee

```solidity
event SetFee(uint256 fee);
```

