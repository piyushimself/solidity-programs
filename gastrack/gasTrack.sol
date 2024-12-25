// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract GasUsageExample {
    function useGas()
        public
        view
        returns (uint gasAtStart, uint gasAfterOp1, uint gasAfterOp2)
    {
        // Gas at the start
        gasAtStart = gasleft();

        // Perform a small operation (gas-consuming)
        uint x = 1 + 2 + 3; // Simple arithmetic
        gasAfterOp1 = gasleft();

        // Perform a more complex operation (more gas-consuming)
        for (uint i = 0; i < 200; i++) {
            x += i; // Loop consumes more gas
        }
        gasAfterOp2 = gasleft();
    }
}
