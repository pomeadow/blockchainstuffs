# Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a script that deploys that contract.

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat run scripts/deploy.js
```

# Some notes
In Truffle you have an optional last configuration object for sending transaction from a specific account. In hardhat you connect a signer (the web3.wallet equivalent) to a contract instance.

As you also see,

a call is expect(await instance.method()).to.equal - its a synchronous call to compare a value using the chai API
a transaction is await expect(instance.method(...)).to.be... - its an asynchronous access to the hardhat networks plugin
There are also a lot more methods, like adding time on chain, or adding blocks, or directly influencing which address interacts with the smart contract. Checkout [https://hardhat.org/hardhat-network/docs/reference#hardhat-network-methods] for this.