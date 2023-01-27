const Spacebear = artifacts.require("Spacebear");
const truffleAssert = require("truffle-assertions");

// In mocha, each test is built describe("...",() => ()) but truffle offers a magic function like this below

contract("Spacebear", (accounts)=>{
    it("should credit an NFT to a specific account", async() => {
        const spacebearInstance = await Spacebear.deployed();
        let txResult = await spacebearInstance.safeMint(accounts[1], "spacebear_1.json");
        // console.log(await spacebearInstance.ownerOf(0));
        console.log(txResult.logs[0].args);
        // assert.equal(txResult.logs[0].event,"Transfer","Event is not the transfer Event");
        truffleAssert.eventEmitted(txResult, "Transfer", {from:"0x0000000000000000000000000000000000000000",to: accounts[1], tokenId: web3.utils.toBN("0")});
        assert.equal(txResult.logs[0].args.from,"0x0000000000000000000000000000000000000000","Not from zero address");
        assert.equal(await spacebearInstance.ownerOf(0), accounts[1], "Owner of Token 1 is not equal Account 2");
    })
})