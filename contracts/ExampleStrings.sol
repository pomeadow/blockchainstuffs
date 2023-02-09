//SPDX-License-Identifier: MIT

// pragma solidity 0.7.6;
pragma solidity 0.8.7;
 // anything before 0.8.x 

contract ExampleStrings {

    string public myString = "Helloworld"; // represented by UTF-8, cannot convert to byte to get length as sometimes a character is 2 bytes
    // bytes public myBytes = "Hello world"; // has length and can convert to string
    bytes public myBytes = unicode"Hello Wörld";

/*
Strings are actually Arrays, very similar to a bytes-array. If that sounds too complicated, let me break down some quirks for you that are somewhat unique to Solidity:

Natively, there are no String manipulation functions.
No even string comparison is natively possible
There are libraries to work with Strings
Strings are expensive to store and work with in Solidity (Gas costs, we talk about them later)
As a rule of thumb: try to avoid storing Strings, use Events instead (more on that later as well!)
*/
    function setMyString(string memory _myString) public {
        myString = _myString;
    }

    function compareTwoStrings(string memory _myString) public view returns (bool) {
        // There is no native string comparison in Solidity. hence use hash. and hash also needs single byte arg
        return keccak256(abi.encodePacked(myString)) == keccak256(abi.encodePacked(_myString));
    }

    function getBytesLength() public view returns(uint) {
        return myBytes.length;
    }
    /*The content is "0x48656c6c6f2057c3b6726c64". If you run it through "web3.utils.toAscii('0x48656c6c6f2057c3b6726c64')" you get back the Ascii representation*/
}
