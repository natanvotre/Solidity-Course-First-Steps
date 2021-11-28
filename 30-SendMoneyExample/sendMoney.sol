pragma solidity ^0.8.7;

contract SendMoney {

    uint public receivedValue;
    uint public lockedUntil;

    function receiveMoney() public payable {
        receivedValue += msg.value;
        lockedUntil = block.timestamp + 1 minutes;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function withdrawMoney() public {
        if (lockedUntil < block.timestamp) {
            address payable to = payable(msg.sender);
            to.transfer(this.getBalance());

            receivedValue = 0;
        }
    }

    function withdrawMoneyTo(address payable _to) public {
        if (lockedUntil < block.timestamp) {
            _to.transfer(this.getBalance());
            receivedValue = 0;
        }
    }
}
