// SPDX-License-Identifier: MIT
pragma solidity 0.8.12;

import {Ownable2Step} from "@openzeppelin/contracts/access/Ownable2Step.sol";
import {Common} from "./libraries/Common.sol";
import {IBribeVault} from "./interfaces/IBribeVault.sol";
import {IRewardDistributor} from "./interfaces/IRewardDistributor.sol";
import {Errors} from "./libraries/Errors.sol";

contract VaultOperator is Ownable2Step {
    IBribeVault public immutable bribeVault;
    IRewardDistributor public immutable rewardDistributor;
    address public operator;

    event SetOperator(address indexed operator);

    /**
        @param  _bribeVault         Address of the bribe vault
        @param  _rewardDistributor  Address of the reward distributor
     */
    constructor(address _bribeVault, address _rewardDistributor) {
        if (_bribeVault == address(0)) revert Errors.InvalidAddress();
        if (_rewardDistributor == address(0)) revert Errors.InvalidAddress();

        bribeVault = IBribeVault(_bribeVault);
        rewardDistributor = IRewardDistributor(_rewardDistributor);

        // Default to the deployer
        operator = msg.sender;
    }

    modifier onlyOperator() {
        if (msg.sender != operator) revert Errors.NotAuthorized();
        _;
    }

    /**
        @notice Set the operator
        @param  _operator  address  Operator address
     */
    function setOperator(address _operator) external onlyOwner {
        if (_operator == address(0)) revert Errors.InvalidAddress();

        operator = _operator;

        emit SetOperator(_operator);
    }

    /**
        @notice Redirect transferBribes call to the bribeVault for approved operator
        @param  rewardIdentifiers  bytes32[]  List of rewardIdentifiers
     */
    function transferBribes(
        bytes32[] calldata rewardIdentifiers
    ) external onlyOperator {
        bribeVault.transferBribes(rewardIdentifiers);
    }

    /**
        @notice Redirect updateRewardsMetadata call to the rewardDistributor for approved operator
        @param  distributions  Distribution[]  List of reward distribution details
     */
    function updateRewardsMetadata(
        Common.Distribution[] calldata distributions
    ) external onlyOperator {
        rewardDistributor.updateRewardsMetadata(distributions);
    }

    /**
        @notice Set pause state on the rewardDistributor for approved operator
        @param  state  bool  Pause state
     */
    function setPauseState(bool state) external onlyOperator {
        rewardDistributor.setPauseState(state);
    }
}
