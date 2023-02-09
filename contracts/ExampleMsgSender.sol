//SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

contract ExampleMsgSender {

    address public someAddress;
    // default address is 0x0000000000000000000000000000000000000000 40 zeroes or 20 bytes worth of 0 after 0x0

    function updateSomeAddress() public {
        // msg is a public object that is available through out all of our contracts that contains several properties
        // sender is the address interacting with the smart contract. it could be an account address or another contract depending on which last calls this contract
        someAddress = msg.sender;
    }
}