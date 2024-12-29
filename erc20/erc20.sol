//SPDX-License-Identifier: MIT License
pragma solidity 0.8.28;

contract ERC-20 {
    string public name;
    string public symbol;

    uint256 public maxsupply;
    uint256 public TotalSupply;
    uint8 public decimals;

    mapping(address => uint256) public balanceOf;
    address public owner;

    mapping(address => mapping(address => uint256)) public allowance;

    constructor(string memory _name, string memory _symbol) {
        name = _name;
        symbol = _symbol;
        decimals = 18;
        maxsupply = 100000;
        owner = msg.sender;
    }

    function mint(uint _number) public {
        require(_number <= maxsupply, "Invalid number");
        require(_number > 0, "number must be a positive number");
        require(msg.sender == owner, "only owner can mint");
        balanceOf[owner] += _number;
        TotalSupply += _number;
    }

    function transfer(address _to, uint256 _amount) public returns (bool) {
        require(balanceOf[msg.sender] >= _amount, "not enough to transfer");
        require(_amount > 0, "number must be a positive number");
        require(_to != address(0), "cannot send to address(0)");
        balanceOf[msg.sender] -= _amount;
        balanceOf[_to] += _amount;
        return true;
    }

    function approve(address spender, uint256 amount) public returns (bool) {
        allowance[msg.sender][spender] = amount;
        return true;
    }

    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) public returns (bool) {
        require(balanceOf[from] >= amount, "not enough money");

        if (msg.sender != from) {
            require(
                allowance[from][msg.sender] >= amount,
                "not enough allowance"
            );

            allowance[from][msg.sender] -= amount;
        }

        balanceOf[from] -= amount;
        balanceOf[to] += amount;
        return true;
    }
}
