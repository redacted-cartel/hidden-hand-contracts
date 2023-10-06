# RewardDistributor
[Git Source](https://github.com/redacted-cartel/hidden-hand-contracts/blob/0eba12837f1598e3ade9a3211813a72a1e056947/contracts/RewardDistributor.sol)

**Inherits:**
AccessControl, ReentrancyGuard, Pausable


## State Variables
### MINIMUM_ACTIVE_TIMER

```solidity
uint256 public constant MINIMUM_ACTIVE_TIMER = 3 hours;
```


### rewards

```solidity
mapping(bytes32 => Reward) public rewards;
```


### claimed

```solidity
mapping(bytes32 => mapping(address => uint256)) public claimed;
```


### activeTimerDuration

```solidity
uint256 public activeTimerDuration;
```


## Functions
### constructor


```solidity
constructor();
```

### claim

Claim rewards based on the specified metadata


```solidity
function claim(Claim[] calldata _claims) external nonReentrant whenNotPaused;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_claims`|`Claim[]`| Claim[] List of claim metadata|


### updateRewardsMetadata

Update rewards metadata


```solidity
function updateRewardsMetadata(Common.Distribution[] calldata _distributions) external onlyRole(DEFAULT_ADMIN_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_distributions`|`Common.Distribution[]`| Distribution[] List of reward distribution details|


### setPauseState

Set the contract's pause state (ie. before taking snapshot for the harvester)

*More efficient compared to setting the merkle proofs of all affected rewardIds to 0x*


```solidity
function setPauseState(bool state) external onlyRole(DEFAULT_ADMIN_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`state`|`bool`| bool  Pause state|


### changeActiveTimerDuration

Set the active timer duration


```solidity
function changeActiveTimerDuration(uint256 _duration) external onlyRole(DEFAULT_ADMIN_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_duration`|`uint256`| uint256  Timer duration|


### _claim

Claim a reward


```solidity
function _claim(bytes32 _identifier, address _account, uint256 _amount, bytes32[] calldata _merkleProof) private;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_identifier`|`bytes32`|  bytes32    Merkle identifier|
|`_account`|`address`|     address    Eligible user account|
|`_amount`|`uint256`|      uint256    Reward amount|
|`_merkleProof`|`bytes32[]`| bytes32[]  Merkle proof|


### _setActiveTimerDuration

*Internal to set the active timer duration*


```solidity
function _setActiveTimerDuration(uint256 _duration) internal;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_duration`|`uint256`| uint256  Timer duration|


## Events
### RewardClaimed

```solidity
event RewardClaimed(bytes32 indexed identifier, address indexed token, address indexed account, uint256 amount);
```

### RewardMetadataUpdated

```solidity
event RewardMetadataUpdated(
    bytes32 indexed identifier, address indexed token, bytes32 merkleRoot, bytes32 proof, uint256 activeAt
);
```

### SetActiveTimerDuration

```solidity
event SetActiveTimerDuration(uint256 duration);
```

## Structs
### Reward

```solidity
struct Reward {
    address token;
    bytes32 merkleRoot;
    bytes32 proof;
    uint256 activeAt;
}
```

### Claim

```solidity
struct Claim {
    bytes32 identifier;
    address account;
    uint256 amount;
    bytes32[] merkleProof;
}
```

