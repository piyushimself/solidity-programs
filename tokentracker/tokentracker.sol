//SPDX-License-Identifier: MIT License
pragma solidity 0.8.28;

contract TokenTracker {
    uint256 public total_balance;
    bool private locked;

    modifier noReentrant() {
        require(!locked, "No reentrancy");
        locked = true;
        _;
        locked = false;
    }

    mapping(address => uint256) private balanceOf;

    function deposit() public payable {
        require(msg.value > 0, "send something");

        total_balance = msg.value + total_balance;
        balanceOf[msg.sender] = balanceOf[msg.sender] + msg.value;
    }

    function withdraw(uint256 _amount) public noReentrant {
        //can be external  for more gas efficient
        require(
            balanceOf[msg.sender] >= _amount * 1 ether,
            "Not enoungh deposit balance"
        );
        require(
            _amount * 1 ether <= total_balance,
            "not enough money to withdraw this much amount"
        );
        total_balance = total_balance - _amount * 1 ether;
        balanceOf[msg.sender] = balanceOf[msg.sender] - _amount * 1 ether;

        (bool success, ) = payable(msg.sender).call{value: _amount * 1 ether}(
            ""
        );
        require(success, "transfer failed");
    }

    function myBalance() external view returns (uint256) {
        return balanceOf[msg.sender];
    }
}
