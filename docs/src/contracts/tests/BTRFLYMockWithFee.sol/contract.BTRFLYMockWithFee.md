# BTRFLYMockWithFee
**Inherits:**
[ERC20](/contracts/tests/ERC20.sol/contract.ERC20.md)


## State Variables
### FEE

```solidity
uint256 public constant FEE = 5000;
```


### FEE_DIVISOR

```solidity
uint256 public constant FEE_DIVISOR = 1_000_000;
```


## Functions
### mint


```solidity
function mint(address account, uint256 amount) external;
```

### transfer


```solidity
function transfer(address recipient, uint256 amount) public virtual override returns (bool);
```

### transferFrom


```solidity
function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool);
```

