pragma solidity ^0.8.7;

contract StructExample {

    mapping(address => uint) public accountBalances;

    address owner;
    mapping(address => bool) masterAccounts;

    constructor() {
        owner = msg.sender;
        masterAccounts[owner] = true;
    }

    fallback() external payable  {
        accountBalances[msg.sender] += msg.value;
    }

    function allowedForMasters() private view {
        require(masterAccounts[msg.sender], "You must be a master to run this operation");
    }

    function convertWeiToEther(uint _value) public pure returns(uint) {
        return _value / 1 ether;
    }

    function getTotalBalance() public view returns(uint) {
        allowedForMasters();
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
