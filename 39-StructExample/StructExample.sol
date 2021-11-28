pragma solidity ^0.8.7;

contract StructExample {

    struct Payment {
        uint amount;
        uint timestamp;
    }

    struct Balance {
        uint totalBalance;
        uint numPayments;
        mapping(uint => Payment) payments;
    }

    mapping(address => Balance) public accountBalances;

    address owner;
    mapping(address => bool) masterAccounts;

    constructor() {
        owner = msg.sender;
        masterAccounts[owner] = true;
    }

    function allowedForMasters() private view {
        require(masterAccounts[msg.sender], "You must be a master to run this operation");
    }

    function getTotalBalance() public view returns(uint) {
        allowedForMasters();
        return address(this).balance;
    }

    function depositMoney() public payable {
        accountBalances[msg.sender].totalBalance += msg.value;

        Payment memory payment = Payment(msg.value, block.timestamp);
        accountBalances[msg.sender].payments[accountBalances[msg.sender].numPayments] = payment;

        accountBalances[msg.sender].numPayments++;
    }

    function getBalance() public view returns(uint) {
        return accountBalances[msg.sender].totalBalance;
    }

    function withdrawMoney(uint _amount) public {
        require(accountBalances[msg.sender].totalBalance >= _amount, "Not enough funds!");
        payable(msg.sender).transfer(_amount);

        accountBalances[msg.sender].totalBalance -= _amount;
    }
}
