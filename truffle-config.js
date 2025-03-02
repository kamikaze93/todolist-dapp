require('dotenv').config();
const HDWalletProvider = require('@truffle/hdwallet-provider');

const MNEMONIC = process.env.MNEMONIC;
const PROJECT_ID = process.env.PROJECT_ID;

module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 9545, // Change to 7545 if using Ganache UI
      network_id: "*", // Match any network
    },
    goerli: {
      provider: () =>
        new HDWalletProvider(MNEMONIC, `https://goerli.infura.io/v3/${PROJECT_ID}`),
      network_id: 5,
      confirmations: 2,
      timeoutBlocks: 200,
      skipDryRun: true,
    },
  },
  
  compilers: {
    solc: {
      version: "0.8.20", // Change based on your contract version
    },
  },
};
