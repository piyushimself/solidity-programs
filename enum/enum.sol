//SPDX-License-Identifier: MIT License
pragma solidity 0.8.28;
contract Enum {
    enum State {
        Created,
        Active,
        Completed,
        Canceled
    }

    State public currentState;

    constructor() {
        currentState = State.Created;
    }

    function activate() public {
        require(
            currentState == State.Created,
            "Can only activate from Created state"
        );
        _changeState(State.Active);
    }
    function Complete() public {
        require(
            currentState == State.Active,
            "Can only Complete from Active state"
        );
        _changeState(State.Completed);
    }

    function Cancel() public {
        require(
            currentState != State.Completed,
            "Cannot cancel a completed state"
        );
        _changeState(State.Canceled);
    }

    function _changeState(State newState) internal {
        currentState = newState;
    }
}
