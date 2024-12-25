//SPDX-License-Identifier: MIT License
pragma solidity 0.8.28;
contract Modifier {
    address private owner;
    uint public value;

    constructor() {
        owner = msg.sender;
    }
    modifier onlyOwner() {
        require(msg.sender == owner, "you are not allowed to access");
        _;
    }
    function setValue(uint _value) public onlyOwner {
        value = _value;
    }
}
