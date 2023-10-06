# IBribeMarket
[Git Source](https://github.com/redacted-cartel/hidden-hand-contracts/blob/0eba12837f1598e3ade9a3211813a72a1e056947/contracts/interfaces/IBribeMarket.sol)


## Functions
### initialize

Initialize the contract


```solidity
function initialize(
    address _bribeVault,
    address _admin,
    string calldata _protocol,
    uint256 _maxPeriods,
    uint256 _periodDuration
) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_bribeVault`|`address`| Bribe vault address|
|`_admin`|`address`|      Admin address|
|`_protocol`|`string`|   Protocol name|
|`_maxPeriods`|`uint256`| Maximum number of periods|
|`_periodDuration`|`uint256`| Period duration|


