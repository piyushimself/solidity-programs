// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract StringOperations {
    // State variable to store concatenated strings
    string public concatenatedString;

    // Function to concatenate and store strings using abi.encodePacked
    function concatenateAndStore(
        string memory str1,
        string memory str2
    ) public {
        concatenatedString = string(abi.encodePacked(str1, str2));
    }
}
