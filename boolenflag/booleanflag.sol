//SPDX-License-Identifier: MIT  License
pragma solidity 0.8.28;

contract BooleanFlag {
    bool public flag;
    address private owner;

    constructor() {
        owner = msg.sender;
    }

    function setFlag(bool _flag) public {
        require(msg.sender == owner);
        flag = _flag;
    }
}
