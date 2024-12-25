//SPDX-License-Identifier: MIT License
pragma solidity 0.8.28;

contract NestedMapping {
    struct UserProfile {
        string name;
        uint256 age;
        address wallet;
    }

    mapping(string => UserProfile) public userProfile;

    function createUser(
        string memory _username,
        string memory _name,
        uint256 _age,
        address _wallet
    ) public {
        require(
            bytes(userProfile[_username].name).length == 0,
            "Profile already exists"
        );
        userProfile[_username] = UserProfile({
            name: _name,
            age: _age,
            wallet: _wallet
        });
    }

    // Function to get user profile details
    function getUserProfile(
        string memory _username
    ) public view returns (string memory, uint256, address) {
        require(
            bytes(userProfile[_username].name).length > 0,
            "Profile does not exist"
        );
        UserProfile memory profile = userProfile[_username];
        return (profile.name, profile.age, profile.wallet);
    }

    // Nested mapping: Mapping from username to another mapping of settings
    // In this example, we will use the setting name (like "isActive") as the key.
    mapping(string => mapping(string => string)) public userSettings;

    // Function to update a specific user setting using a nested mapping
    function updateUserSetting(
        string memory _username,
        string memory _settingKey,
        string memory _settingValue
    ) public {
        // Ensure the profile exists before updating settings
        require(
            bytes(userProfile[_username].name).length > 0,
            "Profile does not exist"
        );

        // Update user setting in the nested mapping
        userSettings[_username][_settingKey] = _settingValue;
    }

    // Function to get a user setting (value)
    function getUserSetting(
        string memory _username,
        string memory _settingKey
    ) public view returns (string memory) {
        // Ensure the profile exists before retrieving settings
        require(
            bytes(userProfile[_username].name).length > 0,
            "Profile does not exist"
        );

        return userSettings[_username][_settingKey];
    }
}
