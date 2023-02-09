//SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

contract ExampleFallback {
    uint public lastValueSent;
    string public lastFunctionCalled;
    uint public myUint;
    function setMyUint(uint _myNewUint) public {
        myUint = _myNewUint;
    }

    // for receiving ether, can only rely on 2300 gas. Gas Stipend
    receive() external payable {
        lastValueSent = msg.value;
        lastFunctionCalled = "receive";
    }
    //fallback if calldata is sent in transaction
    fallback() external payable {
        lastValueSent = msg.value;
        lastFunctionCalled = "fallback";
    }

    // input in the transaction details is the function identifier. you can use it in calldata
    // 0xe492fd840000000000000000000000000000000000000000000000000000000000000002

    //receive() is a function that gets priority over fallback() when a calldata is empty. But fallback gets precedence over receive when calldata does not fit a valid function signature.
}