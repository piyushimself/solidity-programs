// SPDX-License-Identifier: MIT License
pragma solidity 0.8.28;

contract Event {
    address private owner;

    // Events
    event NotEnoughEther(address indexed sender, uint256 value);
    event WithdrawalSuccessful(
        address indexed owner,
        uint256 value,
        string message
    );
    event UnauthorizedWithdrawalAttempt(
        address indexed attemptedBy,
        string message
    );

    constructor() {
        owner = msg.sender;
    }

    function deposite() public payable {
        require(msg.value >= 1 ether, "You don't have enough ether");
        emit NotEnoughEther(msg.sender, msg.value);
    }

    function withdraw() public {
        if (msg.sender != owner) {
            // Emit event for unauthorized withdrawal attempt
            emit UnauthorizedWithdrawalAttempt(
                msg.sender,
                "Unauthorized withdrawal attempt detected"
            );
            revert("You don't have authority to withdraw");
        }

        uint256 contractBalance = address(this).balance;

        (bool success, ) = payable(owner).call{value: contractBalance}("");
        require(success, "Ether transfer failed");

        // Emit event for successful withdrawal with a success message
        emit WithdrawalSuccessful(
            owner,
            contractBalance,
            "Withdrawal successful"
        );
    }
}
