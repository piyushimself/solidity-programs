//SPDX-License-Identifier: MIT License
pragma solidity 0.8.28;

contract Mapping {
    mapping(address => uint) public userbalance;

    function setBalance(uint _newBalance, address _useraddress) public {
        userbalance[_useraddress] = _newBalance;
    }
}
