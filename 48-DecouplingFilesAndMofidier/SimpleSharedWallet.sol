pragma solidity ^0.8.7;

import "./Owned.sol";

contract StructExample is Owned {

    mapping(address => uint) public accountBalances;

    mapping(address => bool) masterAccounts;

    constructor() {
        masterAccounts[owner] = true;
    }

    function getTotalBalance() public view onlyOwner returns(uint) {
        return address(this).balance;
    }

    function depositMoney() public payable {
        accountBalances[msg.sender] += msg.value;
    }

    function getBalance() public view returns(uint) {
        return accountBalances[msg.sender];
    }

    function withdrawMoney(uint _amount) public {
        require(accountBalances[msg.sender] >= _amount, "Not enough funds!");
        assert(accountBalances[msg.sender] <= accountBalances[msg.sender] - _amount);

        payable(msg.sender).transfer(_amount);
        accountBalances[msg.sender] -= _amount;
    }
}
