// SPDX-License-Identifier: MIT
pragma solidity 0.8.12;

interface vlAura {
    event DelegateChanged(
        address indexed delegator,
        address indexed fromDelegate,
        address indexed toDelegate
    );

    /**
        @notice Delegate of the specified account
        @param  account  address  Account
     */
    function delegates(address account) external view returns (address);

    /**
        @notice Balance of the specified user
        @param  user  address  User account
     */
    function balanceOf(address user) external view returns (uint256 amount);

    /**
     * @dev Gets the current votes balance for `account`
     */
    function getVotes(address account) external view returns (uint256);
}
