//SPDX-License-Identifier: MIT License
pragma solidity 0.8.28;

contract Random {
    function getRandomNumber() public view returns (uint256) {
        return
            uint256(
                keccak256(
                    abi.encodePacked(
                        block.timestamp,
                        msg.sender,
                        block.difficulty
                    )
                )
            );
    }
}
