// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract HelloBlockchain {
    string private message;
    address public owner;

    constructor() {
        owner = msg.sender;
        message = "Hello Blockchain";
    }

    function takemsg(string memory newmsg) public {
        require(msg.sender == owner, "only owner can change the msg");
        message = newmsg;
    }

    function getmsg() public  view returns (string memory) {
        return message;
    }
}
