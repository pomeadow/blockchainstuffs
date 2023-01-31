const {expect} = require('chai');
const { ethers } = require('hardhat');
const hre = require('hardhat');
const {loadFixtures} = require('@nomicfoundation/hardhat-network-helpers');

describe("Spacebear", () => {

    // it is not just deploying the contract to the chain but rolling back the chain to where the fixture started.
    async function deploySpacebearAndMintTokenFixture() {
        const Spacebear = await hre.ethers.getContractFactory("Spacebear");
        const spacebearInstance = await Spacebear.deploy();
        const [owner, otherAccount] = await ethers.getSigners();
        await spacebearInstance.safeMint(otherAccount.address);
        return {spacebearInstance};
    }

    it("is possible to mint a token", async () => {
        const {spacebearInstance} = loadFixtures(deploySpacebearAndMintTokenFixture);
        const [owner, otherAccount] = await ethers.getSigners();
        expect(await spacebearInstance.ownerOf(0)).to.equal(otherAccount.address)
    })

    it("fails to transfer the token from the wrong address", async () => {
        const {spacebearInstance} = loadFixtures(deploySpacebearAndMintTokenFixture);
        const [owner, otherAccount, notTheNFTOwner] = await ethers.getSigners();
        // await spacebearInstance.safeMint(otherAccount.address);
        expect(await spacebearInstance.ownerOf(0)).to.equal(otherAccount.address)
        await expect(spacebearInstance.connect(notTheNFTOwner).transferFrom(otherAccount.address, notTheNFTOwner.address,0)).to.be.revertedWith('ERC721: caller is not token owner or approved');
    })
})
