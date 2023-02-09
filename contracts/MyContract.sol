//SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

contract MyContract {

    string public ourString = "Hello World";

    function updateOurString(string memory _updatedString) public {
        ourString = _updatedString;
    }

    function updateOurStringWithPayable(string memory _updatedString) public payable {
        if(msg.value == 1 ether) {
            ourString = _updatedString;
        } else {
            payable(msg.sender).transfer(msg.value);
        }
    }

}
