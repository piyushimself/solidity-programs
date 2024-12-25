//SPDX-License-Identifier: MIT License
pragma solidity 0.8.28;

contract EthTransfer {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function depositEth() public payable {
        require(msg.value == 1 ether, "you should tranfer only one ether");
    }

    function withdrawEth() public {
        require(msg.sender == owner, "only owner can get the deposite ether");
        (bool success, ) = payable(owner).call{value: address(this).balance}(
            ""
        );
        require(success, "Ether transfer failed");
    }
}
