# IPermit2

## Functions
### allowance

A mapping from owner address to token address to spender address to PackedAllowance struct, which contains details and conditions of the approval.

The mapping is indexed in the above order see: allowance[ownerAddress][tokenAddress][spenderAddress]

*The packed slot holds the allowed amount, expiration at which the allowed amount is no longer valid, and current nonce thats updated on any signature based approvals.*


```solidity
function allowance(address user, address token, address spender)
    external
    view
    returns (uint160 amount, uint48 expiration, uint48 nonce);
```

### permit

Permit a spender to a given amount of the owners token via the owner's EIP-712 signature

*May fail if the owner's nonce was invalidated in-flight by invalidateNonce*


```solidity
function permit(address owner, PermitSingle memory permitSingle, bytes calldata signature) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`owner`|`address`|The owner of the tokens being approved|
|`permitSingle`|`PermitSingle`|Data signed over by the owner specifying the terms of approval|
|`signature`|`bytes`|The owner's signature over the permit data|


### transferFrom

Transfer approved tokens from one address to another

*Requires the from address to have approved at least the desired amount
of tokens to msg.sender.*


```solidity
function transferFrom(address from, address to, uint160 amount, address token) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`from`|`address`|The address to transfer from|
|`to`|`address`|The address of the recipient|
|`amount`|`uint160`|The amount of the token to transfer|
|`token`|`address`|The token address to transfer|


## Structs
### PermitDetails
The permit data for a token


```solidity
struct PermitDetails {
    address token;
    uint160 amount;
    uint48 expiration;
    uint48 nonce;
}
```

### PermitSingle
The permit message signed for a single token allowance


```solidity
struct PermitSingle {
    PermitDetails details;
    address spender;
    uint256 sigDeadline;
}
```

