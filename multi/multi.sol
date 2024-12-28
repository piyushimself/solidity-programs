//SPDX-License-Identifier: MIT License
pragma solidity 0.8.28;

contract Multi {
    uint256 public mul;
    address private owner;

    constructor(uint256 _initialmultipier) {
        require(_initialmultipier > 0, "Invalid initial multipier");
        mul = _initialmultipier;
        owner = msg.sender;
    }

    // Function to update the multiplier value
    function setMultiplier(uint256 _newMultiplier) public {
        require(msg.sender == owner, "not authorized to set");
        require(_newMultiplier > 0, "Multiplier must be greater than zero");
        mul = _newMultiplier;
    }

    function multiplication(uint256 _num) external returns (uint256) {
        require(_num > 0, "Invalid initial multipier");
        mul = mul * _num;
        return mul;
    }
}
