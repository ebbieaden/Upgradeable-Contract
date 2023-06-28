const { expect } = require("chai");
const { ethers } = require("hardhat");
const hre = require("hardhat");

describe("ERC721 Upgradeable", function () {
    it("Should deploy an upgradeable ERC721 Contract", async function () {
        const LW3NFT = await ethers.getContractFactory("LW3NFT");
        const LW3NFT2 = await ethers.getContractFactory("LW3NFT2");

        // Deploy LW3NFt on a UUPS contract
        let proxyContract = await hre.upgrades.deployProxy(LW3NFT, {
            kind: "uups",
        });
        const [owner] = await ethers.getSigner();
        const ownerOfToken1 = await proxyContract.ownerOf(1);

        expect(ownerOfToken1).to.equal.upgradeProxy(proxyContract, LW3NFT2);
        // Verify it has been upgraded
        expect(await proxyContract.test()).to.equal("upgraded");
    });
});