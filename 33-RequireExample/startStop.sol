pragma solidity ^0.8.7;

contract SendMoney {
    address owner;
    bool public pause;

    constructor() {
        owner = msg.sender;
    }

    function receiveMoney() public payable {}

    function setPause(bool _pause) public {
        require(msg.sender == owner, "Just owners can do!");
        pause = _pause;
    }

    function withdrawMoneyTo(address payable _to) public {
        require(msg.sender == owner, "Just owners can do!");
        require(!pause, "No can do! Contract is temporally stopped. :(");
        _to.transfer(address(this).balance);
    }

    function destroySmartContract() public {
        require(msg.sender == owner, "Just owners can do!");
        selfdestruct(payable(owner));
    }
}
