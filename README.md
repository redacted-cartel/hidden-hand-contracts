> [Hidden Hand Documentation](https://docs.redacted.finance/products/hidden-hand)
<div align="center">
<img  width="120" padding="0 0 10px" alt="Hidden Hand Logo" src="https://hiddenhand.finance/_next/image?url=%2F_next%2Fstatic%2Fmedia%2FHH-Wordmark-White.86a0d1c9.png&w=384&q=75" />
<p>
  <a href="#" target="_blank">
    <img alt="License: MIT" src="https://img.shields.io/badge/License-MIT-yellow.svg" />
  </a>
  <a href="https://twitter.com/redactedcartel" target="_blank">
    <img alt="Twitter: Redacted Cartel" src="https://img.shields.io/twitter/follow/redactedcartel.svg?style=social" />
  </a>
</p>
</div>

# 🔎 Audits
- [SPEARBIT Hidden Hand v2 Audit Report](https://github.com/redacted-cartel/audits/blob/master/hidden-hand/v2/spearbit.pdf)

# 🛠️ Setup
Make sure you have the following installed:
- Node: tested with 16.13.1
- NPM: tested with 8.1.2

Clone the repo and run the following commands:
1. `git clone https://github.com/redacted-cartel/hidden-hand.git`
2. `cd hidden-hand`
3. Install global and local dependencies
   `npm i -g typescript && npm i`
4. Create a `.env` file with the same variables as `.env.example` and set them
5. Compile contracts and run tests to ensure the project is set up correctly
   `npx hardhat compile && npx hardhat test`

# 📃 Contracts Overview

## BribeVault.sol
- Custodies all bribe tokens until they are ready to be distributed
- Stores data related to bribe tokens and amounts, and proofs for verifying correctness of the arbitrary data related to computing bribe token distributions
- Retrieves protocol fees before transferring funds to the RewardDistributor, and sets the data necessary for ensuring only eligible users can claim rewards

## BribeMarket.sol
- Stores market-specific data used by the client (i.e. frontend app) to display info that directs users to take the right actions that make them eligible for rewards (e.g. vote for proposal X to get Y reward)
- Defines whitelisted tokens, blacklisted voters, maximum number of periods and period duration
- Contains the logic for generating identifiers that are used for storing and accessing relevant BribeVault data
- Transfers all bribe tokens to the BribeVault as they are received and creates or updates the relevant records locally and on BribeVault

## RewardDistributor.sol
- Custodies only the amount of bribe tokens that can be claimed by users
- Verifies claim data to ensure only eligible users can claim rewards
- Provides an interface for BribeVault to set and update the claim-verification data

## RewardHarvester.sol
- Allow users who opt-in to claim rewards in a single token
- Swaps tokens for default token
- Custodies only the amount of bribe tokens that can be claimed by users who opt-in

# 👥 User Roles

## Explicit (defined in-contract)
- **Admins**: Owner-level accounts (e.g. multisig, founder account, etc.) with the ability to call any permissioned method. Their primary responsibilities are role management and funds disbursement (e.g. transferring funds from BribeVault to RewardDistributor along with the required proofs)
- **Depositors**: Thoroughly-vetted contract accounts which implement protocol-specific bribe logic (e.g. market proposal addresses - not every protocol will have this) and have exclusive permission to call BribeVault's `depositBribe` method
- **Team Members**: Team member accounts with the ability to call permissioned methods pertaining to the maintainenance and continued operation of the protocol (e.g. setting the proposals in BribeMarket)
- **Harvester Operator**: Responsible for claiming rewards on behalf of users who opt-in to RewardHarvester and swapping tokens for the default token

## Implicit
- **Briber**: Accounts that submit actions to be taken along with rewards for doing so (e.g. calling a deposit method on BribeMarket to specify a proposal to vote for and the incentives for voting on it)
- **Bribee**: Accounts that take action and claim the associated rewards (e.g. voting on a proposal specified in BribeMarket and claiming their share of the reward after the voting round is over)
- **Auditor**: Entities that verify data and claim proofs (i.e. comparing data against their hashes and merkle roots) to confirm that the rewards were distributed correctly (e.g. verifying that the voting activity on a bribed proposal aligns with the reward distribution).



# 🎬 Action-chain: Market Round
<figure align="center">
  <img src="https://i.imgur.com/5Hv5o7q.png" alt="Contract Diagram" width="600">
  <figcaption>General interaction between the contracts and users</figcaption>
</figure>

A sequential series of actions taken by different users from the beginning of a BribeMarket round (assume the round has started) to the reward claims
0. On the BribeMarket contract, team members set the whitelisted tokens, blacklisted voters, maximum number of periods and period duration
1. On the BribeMarket contract, team members set the round, and set the proposals and the deadlines by which bribers can deposit rewards
2. On the BribeMarket contract, bribers specify the proposals and include the incentives for voting on them. The BribeMarket contract transfers all funds to the BribeVault contract as they are received (i.e. it does not custody funds beyond the deposit method calls) and updates the relevant data on the BribeVault contract
3. Outside of the Hidden Hand contract scope, voters place their votes on the proposals
4. Outside of the Hidden Hand contract scope, after the BribeMarket round ends, proposal data is compiled and these two things happen:
- The following is derived from the data: its hash (KECCAK-256) and merkle roots (one for each bribe token in the round and contains the accounts and amounts each should receive)
- The data file is uploaded to a publicly-accessible location and can be used to verify the hash and merkle roots by an auditor

_NOTE: The data contains everything necessary to generate the merkle roots for reward distribution and also any relevant contextual information (e.g. if a voter is forwarding their rewards to another account, we will include both addresses in the data - only the reward-forwarded account is necessary to generate the merkle roots but knowing the origin/voter account may be useful in an audit)._

5. On the BribeVault contract, an admin calls the transfer bribe method (the data's hash and merkle roots are used here), which results in funds being transferred from the BribeVault to the RewardDistributor
6. On the RewardDistributor contract, eligible accounts (voters or accounts that are forwarded rewards) call the claim method and are transferred their rewards

## Reward Harvester
<figure align="center">
  <img src="https://i.imgur.com/6e6SuDi.png" alt="Contract Diagram" width="600">
  <figcaption>Interaction between the contracts and users for RewardHarvester</figcaption>
</figure>

1. Voters opt-in to the RewardHarvester by calling the opt-in method on the RewardHarvester contract, it is possible to opt-out at any time
2. Harvester Operator call the claim method on the RewardDistributor contract, to claim the rewards on behalf of the opt-in voters
3. Harvester Operator call the swap method on the RewardHarvester contract, to swap the tokens for the default token
4. Voters call the claim method on the RewardHarvesterClaimer contract (which internally claim via the RewardHarvester), to claim their rewards in the default token
