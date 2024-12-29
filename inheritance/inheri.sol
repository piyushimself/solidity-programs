//SPDX-License-Identifier: MIT License
// Base Contract (Parent Contract)
pragma solidity ^0.8.0;

contract Animal {
    string public species;

    function setSpecies(string memory _species) public {
        species = _species;
    }

    function speak() public pure virtual returns (string memory) {
        return "Animal sound";
    }
}

// Derived Contract (Child Contract)
contract Dog is Animal {
    function speak() public pure override returns (string memory) {
        return "Bark";
    }
}

/* 
MULTIPLE INHERITANCE
pragma solidity ^0.8.0;

contract A {
    function foo() public pure virtual returns (string memory) {
        return "A";
    }
}

contract B {
    function foo() public pure virtual returns (string memory) {
        return "B";
    }
}

contract C is A, B {
    function foo() public pure override(A, B) returns (string memory) {
        return "C";
    }
}
*/
