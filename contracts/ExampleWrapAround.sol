//SPDX-License-Identifier: MIT

// pragma solidity 0.7.6;
pragma solidity 0.8.7;
 // anything before 0.8.x 

contract ExampleWrapAround {

    uint256 public myUint;

    uint8 public myUint8 = 250;
    
    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }

    function incrementUint8() public {
        myUint8++;
    }

    function decrementUInt() public {
        unchecked {
            myUint--;
        }
        
    }
}