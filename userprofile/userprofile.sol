//SPDX-License-Identifier: MIT License
pragma solidity 0.8.28;

contract UserProfile {
    struct Person {
        string name;
        uint256 age;
        address wallet;
    }

    Person public person;

    function setPerson(
        string memory _name,
        uint256 _age,
        address _wallet
    ) public {
        person.name = _name;
        person.age = _age;
        person.wallet = _wallet;
    }

    Person[] public people;

    // Function to add a new person to the `people` array
    function addPerson(
        string memory _name,
        uint256 _age,
        address _wallet
    ) public {
        people.push(Person(_name, _age, _wallet));
    }

    function updatePeople(
        uint256 index,
        string memory _name,
        uint256 _age,
        address _wallet
    ) public {
        require(index < people.length, "Index out of bounds");
        people[index].name = _name;
        people[index].age = _age;
        people[index].wallet = _wallet;
    }
}
