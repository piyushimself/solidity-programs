// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract Counter {
    uint256 public counter;

    function inc() public {
        counter = counter + 1;
    }

    function dec() public {
        counter = counter - 1;
    }

    function double() public {
        counter = counter * 2;
    }
}
