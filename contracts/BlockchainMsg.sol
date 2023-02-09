//SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

contract BlockchainMsg {
    // have a message on contract
    // Readable for anyone
    // Writable for only the deployer
    // keep a count of the message changes

    string public myMsg;
    address deployerAddress;
    uint countMsg;

    constructor() {
        deployerAddress = msg.sender;
    }

    function setNewMsg(string memory _newMsg) public {
        require(deployerAddress==msg.sender);
        myMsg=_newMsg;
        countMsg++;
    }

    function getCountMsg() public view returns (uint) {
        return countMsg;
    }

    function getDeployerAddress() public view returns (address) {
        return deployerAddress;
    }

    /* their solution

contract TheBlockchainMessenger {

    uint public changeCounter;

    address public owner;

    string public theMessage;

    constructor() {
        owner = msg.sender;
    }

    function updateTheMessage(string memory _newMessage) public {
        if(msg.sender == owner) {
            theMessage = _newMessage;
            changeCounter++;
        }
    }
}*/
}