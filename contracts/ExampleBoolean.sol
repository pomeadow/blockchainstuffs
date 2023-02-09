//SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

contract ExampleBoolean {

    // For Solidity default bool is false;
    bool public myBool;

    function setMyBool(bool _myBool) public {
        myBool = _myBool;
    }
}