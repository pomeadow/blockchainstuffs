//SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

contract ExampleUint {

    // For Solidity default uint is 0; If we just need default value, leave it blank as assignment cost gas
    uint256 public myUint; // store values from 0 to (2^256) - 1
    uint public myUint2 = 2141253;

    uint8 public myUint8 = 250; // if we want to save on storage/gas cost but side effects is if we use up the storage space..cannot expand. 
    /**
    
        [vm]from: 0x5B3...eddC4to: ExampleUint.incrementUint8() 0x5FD...9d88Dvalue: 0 weidata: 0x84e...a3606logs: 0hash: 0x4e5...a0519
        transact to ExampleUint.incrementUint8 errored: VM error: revert.

        revert
            The transaction has been reverted to the initial state.
        Note: The called function should be payable if you send value and the value you send should be less than your current balance.
        Debug the transaction to get more information.
        call to ExampleUint.myUint8
    */

    uint16 public myUint16; //so on so forth

    int public myInt = -10; // -2^128 to (2^128) - 1

    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }

    function incrementUint8() public {
        myUint8++;
    }

    function decrementUInt() public {
        myUint--;
    }

    function incrementInt() public {
        myInt++;
    }


    // Fixed point numbers
    /*
    ufixedMxN or fixedMxN
    i.e. ufixed128x18 => 128 bits with 18 decimal points
    Fixed points are not implemented yet in Solidity

    Good practice: Assign a decimal point in your smart contract.
    uint numTokens = 10000
    uint decimalPoints = 2
    that gives 100 tokens with divisibility like cents: 53,01
    10000 - 5301 => 4699 => 46,99 left.

    This is why many smart contracts have 18 decimals points (coincidentally IEEE standard for floating points standard)
    */
}