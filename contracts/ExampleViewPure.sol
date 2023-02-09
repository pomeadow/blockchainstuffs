//SPDX-License-Identifier: MIT

pragma solidity 0.8.7;
/*
For example, when we write the address, we modify a state variable. When we update an uint variable, we also modify the state.

For this, we needed to send a transaction. That works very transparently in Remix and also looks instantaneous and completely free of charge, but in reality it isn't. Modifying the State costs gas, is a concurrent operation that requires mining and doesn't return any values.

Reading values, on the other hand, is virtually free and doesn't require mining.

There are two types of reading functions:

view: Accessing state variables
pure: Not accessing state variables
*/

contract ExampleViewPure {
    // the default getter function for public variables and functions marked as view are all view functions // reading functions
    uint public myStorageVariable;
    
    function getMyStorageVariable() public view returns (uint) {
        return myStorageVariable;
    }

    // pure functions can only call non storage variables and other pure functions. but still cost gas to compute but ppl don't need to mine to complete tx
    function getAddition(uint a, uint b) public pure returns (uint) {
        return a+b;
    }

    // writing function
    // function setMyStorageVariable(uint _newVar) public {
    //     myStorageVariable = _newVar;
    // }

// below is a bad idea because the return variables are meant for inter contract communication. writing functions usually don't return values and if so are only for other smart contracts, as we cannot get the output here.
    function setMyStorageVariable(uint _newVar) public returns(uint) {
        myStorageVariable = _newVar;
        return _newVar;
    }
}