// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts-upgradeable@4.9.1/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable@4.9.1/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable@4.9.1/proxy/utils/Initializable.sol";

contract PLAYONE is Initializable, ERC20Upgradeable, OwnableUpgradeable {
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize() initializer public {
        __ERC20_init("PLAYONE", "PYO");
        __Ownable_init();
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(msg.sender, 1000000  * 10 ** decimals());

    }
}
