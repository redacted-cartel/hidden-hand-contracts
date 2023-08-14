// SPDX-License-Identifier: MIT
pragma solidity 0.8.12;

import {Common} from "../libraries/Common.sol";
import {RewardSwapper} from "../RewardSwapper.sol";

contract SwapperMock is RewardSwapper {
    constructor(
        address _rewardDistributor,
        address _rewardHarvester,
        address _operator
    ) RewardSwapper(_rewardDistributor, _rewardHarvester, _operator) {}

    function swap(
        Common.ClaimAndSwapData memory _swapData
    ) external returns (uint256 receivedAmount) {
        receivedAmount = _swap(_swapData);
    }
}
