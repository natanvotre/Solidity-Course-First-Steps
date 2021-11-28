pragma solidity ^0.5.11;

contract MyContract {
    uint256 public myUint;
    bool public myBool;
    address public myAddress;

    function setMyUint(uint256 _myUint) public {
        myUint = _myUint;
    }

    function incrementMyUint() public {
        myUint += 1;
    }

    function decrementMyUint() public {
        myUint -= 1;
    }

    function setMyBool(bool _myBool) public {
        myBool = _myBool;
    }

    function setAddress(address _address) public {
        myAddress = _address;
    }

    function getBalanceOfAddress() public view returns(uint) {
        return myAddress.balance;
    }

    string public myString;

    function setMyString(string memory _myString) public {
        myString = _myString;
    }
}
