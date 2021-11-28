pragma solidity ^0.8.7;

contract mappingPermissionExample {

    mapping(address => bool) allowedAccounts;
    address owner;

    constructor() {
        owner = msg.sender;
        allowedAccounts[owner] = true;
    }

    function checkRegularRequirements() private {
        require(allowedAccounts[msg.sender], "You gotta be on the permission list!");
    }

    function setPermissionTo(address _to, bool value) public {
        checkRegularRequirements();
        require(_to != owner, "You can't set rules to the owner dude!");

        allowedAccounts[_to] = value;
    }

    function receiveMoney() public payable {
        checkRegularRequirements();
    }

    function sendMoneyTo(address payable _to) public {
        checkRegularRequirements();

        _to.transfer(address(this).balance);
    }
}
