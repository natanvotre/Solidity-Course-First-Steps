pragma solidity ^0.8.7;

contract mappingStruct {

    mapping(address => uint) balanceReceived;

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function getMyBalance() public view returns(uint) {
        return balanceReceived[msg.sender];
    }

    function sendMoney() public payable {
        balanceReceived[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable _to, uint _value) public {
        require(balanceReceived[msg.sender] >= _value, "Not enough funds!");

        balanceReceived[msg.sender] -= _value;
        _to.transfer(_value);
    }

    function withdrawAllMoney(address payable _to) public {
        uint senderBalance = balanceReceived[msg.sender];
        uint balanceToSend = senderBalance;
        uint balanceAfter = senderBalance - balanceToSend;
        require(balanceAfter + balanceToSend == senderBalance, "well, something happened");
        balanceReceived[msg.sender] = balanceAfter;

        _to.transfer(balanceToSend);
    }
}
