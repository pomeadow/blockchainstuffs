(async () =>  {
    try {
        // hardhat runtime environment that is injected everytime we run deployment script in Hard hat. if don't have then we have to inject ourselves..
        const Spacebear = await hre.ethers.getContractFactory('Spacebear');
        const spacebearInstance = await Spacebear.deploy();

        await spacebearInstance.deployed();

        console.log(`Deployed contract at ${spacebearInstance.address}`);
    } catch (e) {
        console.error(e);
        process.exitCode = 1;
    }
})()