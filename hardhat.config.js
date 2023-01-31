require("@nomicfoundation/hardhat-toolbox");

const fs = require('fs');

let mnemonic = fs.readFileSync(".secret").toString().trim();
let infuraProjectId = fs.readFileSync(".infura").toString().trim();
let etherscanId = fs.readFileSync(".etherscan").toString().trim();

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  networks: {
    goerli: {
      url: "https://goerli.infura.io/v3/" + infuraProjectId,
      accounts: {
        mnemonic,
        path: "m/44'/60'/0'/0",
        initialIndex: 0,
        count: 10
      }
    }
  },
  // Hardhat already has etherscan verifier integrated so only need to provide API KEY
  etherscan :{
    apiKey: etherscanId
  },
  solidity: "0.8.17",
};
