//SPDX-License-Identifier: MIT License
pragma solidity 0.8.28;

contract Array {
    uint256[] public num;

    function append(uint256 a) public {
        num.push(a);
    }

    function popnum() public {
        num.pop();
    }

    function deletenum(uint256 index) public {
        require(index < num.length, "Index out of bounds");
        num[index] = 0;
    }

    function update(uint256 index, uint256 newnum) public {
        require(index <= num.length, "Index out of bounds");
        num[index] = newnum;
    }

    function deletewithoutgap(uint256 index) public {
        require(index < num.length, "Index out of bounds");
        num[index] = num[num.length - 1];
        num.pop();
    }

    function arrlength() public view returns (uint256) {
        return num.length;
    }

    function printArray() public view returns (uint256[] memory) {
        return num;
    }

    function readUsingLoop() public view returns (uint256[] memory) {
        uint256[] memory result = new uint256[](num.length);
        for (uint256 i = 0; i < num.length; i++) {
            result[i] = num[i];
        }
        return result;
    }
}
