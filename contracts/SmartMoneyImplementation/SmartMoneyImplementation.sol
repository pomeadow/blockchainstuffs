//SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

contract SmartMoneyImplementation {
    // acct send 1 ETH to Wallet SC in ETH
    // see balance
    // withdraw all
    // withdraw to specific address

    function getContractBalance() public view returns(uint) {
        return address(this).balance;
    }

    function withdrawAll(address to) public {
        payable(to).transfer(address(this).balance);
        // can also write address payable to = payable(msg.sender)
    }

    function viewBalance() public view returns (uint) {
        return address(this).balance;
    }

    function withdrawTo(address to, uint value) public {
        require(value <= address(this).balance);
        payable(to).transfer(value);
    }

    receive() external payable {

    }
/*
contract SendWithdrawMoney {

    uint public balanceReceived;
    function deposit() public payable {
        balanceReceived += msg.value;
    }

    function getContractBalance() public view returns(uint) {
        return address(this).balance;
    }

    function withdrawAll() public {
        address payable to = payable(msg.sender);
        to.transfer(getContractBalance());
    }

    function withdrawToAddress(address payable to) public {
        to.transfer(getContractBalance());
    }
}
*/
}