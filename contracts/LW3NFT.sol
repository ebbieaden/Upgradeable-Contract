// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract LW3NFT is 
    Initializable,
    ERC721Upgradeable,
    UUPSUpgradeable,
    OwnableUpgradeable
{
    // We create the initializwe function and then added the initializer modifier
    // which ensures that the initialize function is only called once
    function initialize() public initializer {
        // Instead of using the ERC721 constructor, we have to manuallu initialize it 
        // Same goes for the Ownable contract where we have to manually initialize it 
        __ERC721_init("LW3NFT", "LWNFT");
        __Ownable_init();
        _mint(msg.sender, 1);
    }

    function _authorizeUpgrade(address newImplementation)
        internal
        overrride
        onlyOwner
    {}
}
