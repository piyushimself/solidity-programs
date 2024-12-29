//SPDX-License-Identifier: MIT License
pragma solidity 0.8.28;

contract SecureTransfer {
    address public owner;

    // Events for logging
    event Received(address indexed sender, uint256 amount);
    event Sent(address indexed receiver, uint256 amount);

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {
        emit Received(msg.sender, msg.value);
    }

    fallback() external payable {
        emit Received(msg.sender, msg.value);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function SendEther(address _to, uint256 _amount) public {
        require(msg.sender == owner, "you are not allowed");
        require(
            _amount <= address(this).balance,
            "amount must be equal or less then the contract balance"
        );

        (bool success, ) = payable(_to).call{value: _amount}("");
        require(success, "failed transfer");

        emit Sent(_to, _amount);
    }
}
