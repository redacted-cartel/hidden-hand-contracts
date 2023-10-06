# BribeVault
[Git Source](https://github.com/redacted-cartel/hidden-hand-contracts/blob/0eba12837f1598e3ade9a3211813a72a1e056947/contracts/BribeVault.sol)

**Inherits:**
AccessControl


## State Variables
### PERMIT2

```solidity
IPermit2 public constant PERMIT2 = IPermit2(0x000000000022D473030F116dDEE9F6B43aC78BA3);
```


### FEE_DIVISOR

```solidity
uint256 public constant FEE_DIVISOR = 1_000_000;
```


### FEE_MAX

```solidity
uint256 public immutable FEE_MAX;
```


### DEPOSITOR_ROLE

```solidity
bytes32 public constant DEPOSITOR_ROLE = keccak256("DEPOSITOR_ROLE");
```


### fee

```solidity
uint256 public fee;
```


### feeRecipient

```solidity
address public feeRecipient;
```


### distributor

```solidity
address public distributor;
```


### bribes

```solidity
mapping(bytes32 => Bribe) public bribes;
```


### rewardToBribes

```solidity
mapping(bytes32 => bytes32[]) public rewardToBribes;
```


### rewardTransfers

```solidity
mapping(bytes32 => Transfer) public rewardTransfers;
```


### rewardForwarding

```solidity
mapping(address => address) public rewardForwarding;
```


## Functions
### constructor


```solidity
constructor(uint256 _fee, uint256 _feeMax, address _feeRecipient, address _distributor);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_fee`|`uint256`|          uint256  Fee|
|`_feeMax`|`uint256`|       unt256   Maximum fee|
|`_feeRecipient`|`address`| address  Fee recipient|
|`_distributor`|`address`|  address  Reward distributor address|


### grantDepositorRole

Grant the depositor role to an address


```solidity
function grantDepositorRole(address depositor) external onlyRole(DEFAULT_ADMIN_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`depositor`|`address`| address  Address to grant the depositor role|


### revokeDepositorRole

Revoke the depositor role from an address


```solidity
function revokeDepositorRole(address depositor) external onlyRole(DEFAULT_ADMIN_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`depositor`|`address`| address  Address to revoke the depositor role|


### setFee

Set the fee collected by the protocol


```solidity
function setFee(uint256 _fee) external onlyRole(DEFAULT_ADMIN_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_fee`|`uint256`| uint256  Fee|


### setFeeRecipient

Set the protocol address where fees will be transferred


```solidity
function setFeeRecipient(address _feeRecipient) external onlyRole(DEFAULT_ADMIN_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_feeRecipient`|`address`| address  Fee recipient|


### setDistributor

Set the RewardDistributor contract address


```solidity
function setDistributor(address _distributor) external onlyRole(DEFAULT_ADMIN_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_distributor`|`address`| address  Distributor|


### generateBribeVaultIdentifier

Generate the BribeVault identifier based on a scheme


```solidity
function generateBribeVaultIdentifier(address _market, bytes32 _proposal, uint256 _proposalDeadline, address _token)
    public
    pure
    returns (bytes32 id);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_market`|`address`|          address  Market that originated the bribe|
|`_proposal`|`bytes32`|        bytes32  Proposal|
|`_proposalDeadline`|`uint256`|uint256  Proposal deadline|
|`_token`|`address`|           address  Token|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`id`|`bytes32`|               bytes32  BribeVault identifier|


### generateRewardIdentifier

Generate the reward identifier based on a scheme


```solidity
function generateRewardIdentifier(address _market, address _token, uint256 _proposalDeadline)
    public
    pure
    returns (bytes32 id);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_market`|`address`|           address  Market that originated the reward|
|`_token`|`address`|            address  Token|
|`_proposalDeadline`|`uint256`| uint256  Proposal deadline|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`id`|`bytes32`|                bytes32  Reward identifier|


### getBribe

Get bribe information based on the specified identifier


```solidity
function getBribe(bytes32 bribeIdentifier) external view returns (address token, uint256 amount);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`bribeIdentifier`|`bytes32`| bytes32  The specified bribe identifier|


### getBribeIdentifiersByRewardIdentifier

Return the list of bribe identifiers tied to the specified reward identifier


```solidity
function getBribeIdentifiersByRewardIdentifier(bytes32 rewardIdentifier) external view returns (bytes32[] memory);
```

### _transferWithPermit

Use permit to perform token transfer


```solidity
function _transferWithPermit(Common.DepositBribeParams calldata _dp) internal;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_dp`|`Common.DepositBribeParams`| DepositBribeParams  Deposit data|


### depositBribe

Deposit bribe (ERC20 only)


```solidity
function depositBribe(Common.DepositBribeParams calldata _dp) external onlyRole(DEPOSITOR_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_dp`|`Common.DepositBribeParams`| DepositBribeParams  Deposit data|


### setRewardForwarding

Voters can opt in or out of reward-forwarding

Opt-in: A voter sets another address to forward rewards to

Opt-out: A voter sets their own address or the zero address


```solidity
function setRewardForwarding(address to) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`to`|`address`| address  Account that rewards will be sent to|


### calculateTransferAmounts

Calculate transfer amounts


```solidity
function calculateTransferAmounts(bytes32 rewardIdentifier)
    private
    view
    returns (uint256 feeAmount, uint256 distributorAmount);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`rewardIdentifier`|`bytes32`|  bytes32  Unique identifier related to reward|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`feeAmount`|`uint256`|         uint256  Amount sent to the protocol treasury|
|`distributorAmount`|`uint256`| uint256  Amount sent to the RewardDistributor|


### transferBribes

Transfer fees to fee recipient and bribes to distributor and update rewards metadata


```solidity
function transferBribes(bytes32[] calldata rewardIdentifiers) external onlyRole(DEFAULT_ADMIN_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`rewardIdentifiers`|`bytes32[]`| bytes32[]  List of rewardIdentifiers|


### emergencyWithdraw

Withdraw ERC20 tokens to the admin address


```solidity
function emergencyWithdraw(address token, uint256 amount) external onlyRole(DEFAULT_ADMIN_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token`|`address`|  address  Token address|
|`amount`|`uint256`| uint256  Token amount|


## Events
### SetFee

```solidity
event SetFee(uint256 _fee);
```

### SetFeeRecipient

```solidity
event SetFeeRecipient(address _feeRecipient);
```

### SetDistributor

```solidity
event SetDistributor(address _distributor);
```

### DepositBribe

```solidity
event DepositBribe(
    address indexed market,
    bytes32 indexed proposal,
    uint256 indexed deadline,
    address token,
    address briber,
    uint256 amount,
    uint256 totalAmount,
    uint256 maxTokensPerVote,
    uint256 periodIndex
);
```

### SetRewardForwarding

```solidity
event SetRewardForwarding(address from, address to);
```

### TransferBribe

```solidity
event TransferBribe(
    bytes32 indexed rewardIdentifier, address indexed token, uint256 feeAmount, uint256 distributorAmount
);
```

### EmergencyWithdrawal

```solidity
event EmergencyWithdrawal(address indexed token, uint256 amount, address admin);
```

## Structs
### Bribe

```solidity
struct Bribe {
    address token;
    uint256 amount;
}
```

### Transfer

```solidity
struct Transfer {
    uint256 feeAmount;
    uint256 distributorAmountTransferred;
    uint256 distributorAmountReceived;
}
```

