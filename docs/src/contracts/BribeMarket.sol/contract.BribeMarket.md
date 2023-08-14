# BribeMarket
**Inherits:**
AccessControl, ReentrancyGuard


## State Variables
### TEAM_ROLE

```solidity
bytes32 public constant TEAM_ROLE = keccak256("TEAM_ROLE");
```


### MAX_PERIODS

```solidity
uint256 public constant MAX_PERIODS = 10;
```


### MAX_PERIOD_DURATION

```solidity
uint256 public constant MAX_PERIOD_DURATION = 30 days;
```


### PROTOCOL

```solidity
string public PROTOCOL;
```


### BRIBE_VAULT

```solidity
address public BRIBE_VAULT;
```


### maxPeriods

```solidity
uint256 public maxPeriods;
```


### periodDuration

```solidity
uint256 public periodDuration;
```


### _allWhitelistedTokens

```solidity
address[] private _allWhitelistedTokens;
```


### _allBlacklistedVoters

```solidity
address[] private _allBlacklistedVoters;
```


### proposalDeadlines

```solidity
mapping(bytes32 => uint256) public proposalDeadlines;
```


### indexOfWhitelistedToken

```solidity
mapping(address => uint256) public indexOfWhitelistedToken;
```


### indexOfBlacklistedVoter

```solidity
mapping(address => uint256) public indexOfBlacklistedVoter;
```


### _initialized

```solidity
bool private _initialized;
```


## Functions
### onlyAuthorized


```solidity
modifier onlyAuthorized();
```

### onlyInitializer


```solidity
modifier onlyInitializer();
```

### initialize

Initialize the contract


```solidity
function initialize(
    address _bribeVault,
    address _admin,
    string calldata _protocol,
    uint256 _maxPeriods,
    uint256 _periodDuration
) external onlyInitializer;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_bribeVault`|`address`| Bribe vault address|
|`_admin`|`address`|      Admin address|
|`_protocol`|`string`|   Protocol name|
|`_maxPeriods`|`uint256`| Maximum number of periods|
|`_periodDuration`|`uint256`| Period duration|


### setProposals

Set multiple proposals with arbitrary bytes data as identifiers under the same deadline


```solidity
function setProposals(bytes[] calldata _identifiers, uint256 _deadline) external onlyAuthorized;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_identifiers`|`bytes[]`| bytes[]  identifiers|
|`_deadline`|`uint256`|    uint256  Proposal deadline|


### setProposalsById

Set proposals based on the index of the proposal and the number of choices


```solidity
function setProposalsById(uint256 _proposalIndex, uint256 _choiceCount, uint256 _deadline) external onlyAuthorized;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_proposalIndex`|`uint256`| uint256  Proposal index|
|`_choiceCount`|`uint256`|   uint256  Number of choices to be voted for|
|`_deadline`|`uint256`|      uint256  Proposal deadline|


### setProposalsByAddress

Set multiple proposals for many addresses under the same deadline


```solidity
function setProposalsByAddress(address[] calldata _addresses, uint256 _deadline) external onlyAuthorized;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_addresses`|`address[]`| address[]  addresses (eg. gauge addresses)|
|`_deadline`|`uint256`|  uint256    Proposal deadline|


### grantTeamRole

Grant the team role to an address


```solidity
function grantTeamRole(address _teamMember) external onlyRole(DEFAULT_ADMIN_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_teamMember`|`address`| address  Address to grant the teamMember role|


### revokeTeamRole

Revoke the team role from an address


```solidity
function revokeTeamRole(address _teamMember) external onlyRole(DEFAULT_ADMIN_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_teamMember`|`address`| address  Address to revoke the teamMember role|


### setMaxPeriods

Set maximum periods for submitting bribes ahead of time


```solidity
function setMaxPeriods(uint256 _periods) external onlyRole(DEFAULT_ADMIN_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_periods`|`uint256`| uint256  Maximum periods|


### setPeriodDuration

Set period duration per voting round


```solidity
function setPeriodDuration(uint256 _periodDuration) external onlyRole(DEFAULT_ADMIN_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_periodDuration`|`uint256`| uint256  Period duration|


### addWhitelistedTokens

Add whitelisted tokens


```solidity
function addWhitelistedTokens(address[] calldata _tokens) external onlyAuthorized;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_tokens`|`address[]`| address[]  Tokens to add to whitelist|


### removeWhitelistedTokens

Remove whitelisted tokens


```solidity
function removeWhitelistedTokens(address[] calldata _tokens) external onlyAuthorized;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_tokens`|`address[]`| address[]  Tokens to remove from whitelist|


### addBlacklistedVoters

Add blacklisted voters


```solidity
function addBlacklistedVoters(address[] calldata _voters) external onlyRole(DEFAULT_ADMIN_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_voters`|`address[]`| address[]  Voters to add to blacklist|


### removeBlacklistedVoters

Remove blacklisted voters


```solidity
function removeBlacklistedVoters(address[] calldata _voters) external onlyRole(DEFAULT_ADMIN_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_voters`|`address[]`| address[]  Voters to remove from blacklist|


### depositBribe

Deposit bribe for a proposal (ERC20 tokens only)


```solidity
function depositBribe(bytes32 _proposal, address _token, uint256 _amount, uint256 _maxTokensPerVote, uint256 _periods)
    external
    nonReentrant;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_proposal`|`bytes32`|         bytes32  Proposal|
|`_token`|`address`|            address  Token|
|`_amount`|`uint256`|           uint256  Token amount|
|`_maxTokensPerVote`|`uint256`| uint256  Max amount of token per vote|
|`_periods`|`uint256`|          uint256  Number of periods the bribe will be valid|


### depositBribeWithPermit

Deposit bribe for a proposal (ERC20 tokens only) using permit


```solidity
function depositBribeWithPermit(
    bytes32 _proposal,
    address _token,
    uint256 _amount,
    uint256 _maxTokensPerVote,
    uint256 _periods,
    uint256 _permitDeadline,
    bytes memory _signature
) external nonReentrant;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_proposal`|`bytes32`|         bytes32  Proposal|
|`_token`|`address`|            address  Token|
|`_amount`|`uint256`|           uint256  Token amount|
|`_maxTokensPerVote`|`uint256`| uint256  Max amount of token per vote|
|`_periods`|`uint256`|          uint256  Number of periods the bribe will be valid|
|`_permitDeadline`|`uint256`|   uint256  Deadline for permit signature|
|`_signature`|`bytes`|        bytes    Permit signature|


### getWhitelistedTokens

Return the list of currently whitelisted token addresses


```solidity
function getWhitelistedTokens() external view returns (address[] memory);
```

### getBlacklistedVoters

Return the list of currently blacklisted voter addresses


```solidity
function getBlacklistedVoters() external view returns (address[] memory);
```

### getBribe

Get bribe from BribeVault


```solidity
function getBribe(bytes32 _proposal, uint256 _proposalDeadline, address _token)
    external
    view
    returns (address bribeToken, uint256 bribeAmount);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_proposal`|`bytes32`|         bytes32  Proposal|
|`_proposalDeadline`|`uint256`| uint256  Proposal deadline|
|`_token`|`address`|            address  Token|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`bribeToken`|`address`|        address  Token address|
|`bribeAmount`|`uint256`|       address  Token amount|


### isWhitelistedToken

Return whether the specified token is whitelisted


```solidity
function isWhitelistedToken(address _token) public view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_token`|`address`| address Token address to be checked|


### isBlacklistedVoter

Return whether the specified address is blacklisted


```solidity
function isBlacklistedVoter(address _voter) public view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_voter`|`address`| address Voter address to be checked|


### _depositBribe

Deposit bribe for a proposal (ERC20 tokens only) with optional permit parameters


```solidity
function _depositBribe(
    bytes32 _proposal,
    address _token,
    uint256 _amount,
    uint256 _maxTokensPerVote,
    uint256 _periods,
    uint256 _permitDeadline,
    bytes memory _signature
) internal;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_proposal`|`bytes32`|         bytes32  Proposal|
|`_token`|`address`|            address  Token|
|`_amount`|`uint256`|           uint256  Token amount|
|`_maxTokensPerVote`|`uint256`| uint256  Max amount of token per vote|
|`_periods`|`uint256`|          uint256  Number of periods the bribe will be valid|
|`_permitDeadline`|`uint256`|   uint256  Deadline for permit signature|
|`_signature`|`bytes`|        bytes    Permit signature|


### _setProposal

Set a single proposal


```solidity
function _setProposal(bytes32 _proposal, uint256 _deadline) internal;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_proposal`|`bytes32`| bytes32  Proposal|
|`_deadline`|`uint256`| uint256  Proposal deadline|


## Events
### Initialize

```solidity
event Initialize(address bribeVault, address admin, string protocol, uint256 maxPeriods, uint256 periodDuration);
```

### GrantTeamRole

```solidity
event GrantTeamRole(address teamMember);
```

### RevokeTeamRole

```solidity
event RevokeTeamRole(address teamMember);
```

### SetProposals

```solidity
event SetProposals(bytes32[] proposals, uint256 indexed deadline);
```

### SetProposalsById

```solidity
event SetProposalsById(uint256 indexed proposalIndex, bytes32[] proposals, uint256 indexed deadline);
```

### SetProposalsByAddress

```solidity
event SetProposalsByAddress(bytes32[] proposals, uint256 indexed deadline);
```

### AddWhitelistedTokens

```solidity
event AddWhitelistedTokens(address[] tokens);
```

### RemoveWhitelistedTokens

```solidity
event RemoveWhitelistedTokens(address[] tokens);
```

### SetMaxPeriods

```solidity
event SetMaxPeriods(uint256 maxPeriods);
```

### SetPeriodDuration

```solidity
event SetPeriodDuration(uint256 periodDuration);
```

### AddBlacklistedVoters

```solidity
event AddBlacklistedVoters(address[] voters);
```

### RemoveBlacklistedVoters

```solidity
event RemoveBlacklistedVoters(address[] voters);
```

