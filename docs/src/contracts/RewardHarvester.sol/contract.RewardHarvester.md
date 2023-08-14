# RewardHarvester
**Inherits:**
Ownable2Step


## State Variables
### FEE_BASIS

```solidity
uint256 public constant FEE_BASIS = 1_000_000;
```


### MAX_FEE

```solidity
uint256 public constant MAX_FEE = 100_000;
```


### MINIMUM_ACTIVE_TIMER

```solidity
uint256 public constant MINIMUM_ACTIVE_TIMER = 3 hours;
```


### isMember

```solidity
mapping(address => bool) public isMember;
```


### feesCollected

```solidity
mapping(address => uint256) public feesCollected;
```


### rewards

```solidity
mapping(address => Reward) public rewards;
```


### claimed

```solidity
mapping(address => mapping(address => uint256)) public claimed;
```


### defaultToken

```solidity
address public defaultToken;
```


### operator

```solidity
address public operator;
```


### claimer

```solidity
address public claimer;
```


### rewardSwapper

```solidity
address public rewardSwapper;
```


### activeTimerDuration

```solidity
uint256 public activeTimerDuration;
```


## Functions
### onlyOperatorOrOwner

Modifier to check caller is operator


```solidity
modifier onlyOperatorOrOwner();
```

### onlyOperatorOrRewardSwapper

Modifier to check caller is operator or reward swapper


```solidity
modifier onlyOperatorOrRewardSwapper();
```

### constructor


```solidity
constructor(address _rewardSwapper, address _operator, address _defaultToken);
```

### join

Join the harvester to enable claiming rewards in default token


```solidity
function join() external;
```

### leave

Leave harvester


```solidity
function leave() external;
```

### claim

Claim rewards based on the specified metadata

*Can only be called by the claimer contract*


```solidity
function claim(
    address _token,
    address _account,
    uint256 _amount,
    bytes32[] calldata _merkleProof,
    uint256 _fee,
    address _receiver
) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_token`|`address`|       address    Token to claim rewards|
|`_account`|`address`|     address    Account to claim rewards|
|`_amount`|`uint256`|      uint256    Amount of rewards to claim|
|`_merkleProof`|`bytes32[]`| bytes32[]  Merkle proof of the claim|
|`_fee`|`uint256`|         uint256    Claim fee|
|`_receiver`|`address`|    address    Receiver of the rewards|


### depositReward

Deposit `defaultToken` to this contract


```solidity
function depositReward(uint256 _amount) external onlyOperatorOrRewardSwapper;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_amount`|`uint256`| uint256  Amount of `defaultToken` to deposit|


### updateRewardsMetadata

Update rewards metadata


```solidity
function updateRewardsMetadata(address _token, bytes32 _merkleRoot, bytes32 _hashedData) external onlyOperatorOrOwner;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_token`|`address`|      address  Token to update rewards metadata|
|`_merkleRoot`|`bytes32`| bytes32  Merkle root of the rewards|
|`_hashedData`|`bytes32`| bytes32  Hashed data of the rewards|


### collectFees

Collect fees


```solidity
function collectFees(address _token) external onlyOwner;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_token`|`address`| address  Token to collect fees|


### changeOperator

Change the operator


```solidity
function changeOperator(address _operator) external onlyOwner;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_operator`|`address`| address  New operator address|


### changeDefaultToken

Change the `defaultToken`


```solidity
function changeDefaultToken(address _newToken) external onlyOwner;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_newToken`|`address`| address  New default token address|


### changeRewardSwapper

Change the RewardSwapper contract


```solidity
function changeRewardSwapper(address _newSwapper) external onlyOwner;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_newSwapper`|`address`| address  New reward swapper address|


### changeClaimer

Change claimer address


```solidity
function changeClaimer(address _claimer) external onlyOwner;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_claimer`|`address`| address  New claimer address|


### changeActiveTimerDuration

Set the active timer duration


```solidity
function changeActiveTimerDuration(uint256 _duration) external onlyOwner;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_duration`|`uint256`| uint256  Timer duration|


### _setDefaultToken

*Internal to set the default token*


```solidity
function _setDefaultToken(address _newToken) internal;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_newToken`|`address`| address  Token address|


### _setRewardSwapper

*Internal to set the RewardSwapper contract*


```solidity
function _setRewardSwapper(address _newSwapper) internal;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_newSwapper`|`address`| address  RewardSwapper address|


### _setOperator

*Internal to set the operator*


```solidity
function _setOperator(address _operator) internal;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_operator`|`address`| address  Token address|


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
### MemberJoined

```solidity
event MemberJoined(address member);
```

### MemberLeft

```solidity
event MemberLeft(address member);
```

### FeesCollected

```solidity
event FeesCollected(address indexed token, uint256 amount);
```

### BribeTransferred

```solidity
event BribeTransferred(address indexed token, uint256 totalAmount);
```

### RewardClaimed

```solidity
event RewardClaimed(
    address indexed token, address indexed account, uint256 amount, uint256 postFeeAmount, address receiver
);
```

### RewardMetadataUpdated

```solidity
event RewardMetadataUpdated(address indexed token, bytes32 merkleRoot, bytes32 proof, uint256 activeAt);
```

### DefaultTokenUpdated

```solidity
event DefaultTokenUpdated(address indexed token);
```

### SetOperator

```solidity
event SetOperator(address indexed operator);
```

### SetClaimer

```solidity
event SetClaimer(address indexed claimer);
```

### SetRewardSwapper

```solidity
event SetRewardSwapper(address indexed rewardSwapper);
```

### SetActiveTimerDuration

```solidity
event SetActiveTimerDuration(uint256 duration);
```

## Structs
### Reward

```solidity
struct Reward {
    bytes32 merkleRoot;
    bytes32 hashedData;
    uint256 activeAt;
}
```

