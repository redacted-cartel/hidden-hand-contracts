import * as dotenv from 'dotenv';

import { HardhatUserConfig, task } from 'hardhat/config';

import '@nomiclabs/hardhat-waffle';
import '@typechain/hardhat';
import 'hardhat-gas-reporter';
import 'solidity-docgen';
import 'solidity-coverage'
// import '@nomiclabs/hardhat-etherscan';

dotenv.config();

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task('accounts', 'Prints the list of accounts', async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

const config: HardhatUserConfig = {
  solidity: {
    compilers: [
      {
        version: '0.7.5',
        settings: {
          optimizer: {
            enabled: true,
            runs: 200,
          },
        },
      },
      {
        version: '0.8.12',
        settings: {
          optimizer: {
            enabled: true,
            runs: 200,
            details: {
              "yul": true,
              yulDetails: {
                optimizerSteps: "u",
              },
            },
          },
          viaIR: true,
        },
      },
    ],
  },
  networks: {
    goerli: {
      url: '',
      accounts:
          process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY] : [],
    },
    mainnet: {
      url: process.env.MAINNET_URL,
      gasPrice: 80000000000,

      accounts:
          process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY] : [],
    },
    hardhat: {
      chainId: 31337,
      forking: {
        blockNumber: 17084944,
        url:
            process.env.MAINNET_URL !== undefined ? process.env.MAINNET_URL : '',
      },
      accounts: {
        mnemonic: process.env.SEED,
      },
    },
    optimism: {
      url: process.env.OPTIMISM_URL || '',
      // gasPrice: 80000000000,
      accounts:
          process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY] : [],
    },
    metis: {
      chainId: 1088,
      url: 'https://andromeda.metis.io/?owner=1088',
      // gasPrice: 80000000000,
      accounts:
          process.env.METIS_KEY !== undefined ? [process.env.METIS_KEY] : [],
    },
  },
  // etherscan: {
  //   apiKey: {
  //     mainnet: process.env.ETHERSCAN_API ? process.env.ETHERSCAN_API : '',
  //     optimisticEthereum: process.env.OPTIMISTICSCAN_API
  //       ? process.env.OPTIMISTICSCAN_API
  //       : '',
  //   },
  // },
  mocha: {
    timeout: 60000,
  },
  typechain: {
    target: 'ethers-v5',
    externalArtifacts: ['lib/contracts/*.json'],
  },
};

export default config;
