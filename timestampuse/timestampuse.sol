//SPDX-License-Identifier: MIT License
pragma solidity 0.8.28;

contract TimeStampCheck {
    uint256 private currentTimestamp;
    address private owner;

    constructor() {
        owner = msg.sender;
        currentTimestamp = block.timestamp;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function depositeEth() public payable {
        require(msg.value >= 1 ether, "not enough eth");
    }

    function withdrawEth() public onlyOwner {
        require(
            address(this).balance >= 1 ether,
            "not enough ether to withdraw"
        );
        require(
            block.timestamp >= 1 + currentTimestamp,
            "You can't withdraw before 1 day"
        );

        (bool success, ) = payable(owner).call{value: address(this).balance}(
            ""
        );
        require(success, "not possible to withdraw");
    }
}
