// SPDX-License-Identifier: MIT
pragma solidity 0.8.12;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract BTRFLYMockWithFee is ERC20("Redacted Cartel", "BTRFLY") {
    uint256 public constant FEE = 5000;
    uint256 public constant FEE_DIVISOR = 1_000_000;

    function mint(address account, uint256 amount) external {
        _mint(account, amount);
    }

    function transfer(address recipient, uint256 amount)
        public
        virtual
        override
        returns (bool)
    {
        // Not concerned with where the fee goes as long as it's deducted from amount
        uint256 feeAmount = (amount * FEE) / FEE_DIVISOR;
        _transfer(_msgSender(), recipient, amount - feeAmount);
        return true;
    }

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) public override returns (bool) {
        uint256 feeAmount = (amount * FEE) / FEE_DIVISOR;
        _transfer(sender, recipient, amount - feeAmount);

        uint256 currentAllowance = allowance(sender, _msgSender());
        require(
            currentAllowance >= amount,
            "ERC20: transfer amount exceeds allowance"
        );
        unchecked {
            _approve(sender, _msgSender(), currentAllowance - amount);
        }

        return true;
    }
}
