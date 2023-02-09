// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "forge-std/Script.sol";
import "../src/Spacebear.sol";

contract DeploySpacebear is Script {

    function setUp() public {

    }
    function run() public {
        string memory seedPhrase = vm.readFile(".secret");
        uint256 privateKey = vm.deriveKey("seedPhrase",0);
        vm.startBroadcast(privateKey);
        Spacebear spacebear = new Spacebear();

        vm.stopBroadcast();
    }
}