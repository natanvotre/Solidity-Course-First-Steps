pragma solidity ^0.5.11;

contract MyContract {
    uint256 public myUint;

    function setMyUint(uint256 _myUint) public {
        myUint = _myUint;
    }

    function incrementMyUint() public {
        myUint += 1;
    }

    function decrementMyUint() public {
        myUint -= 1;
    }

    bool public myBool;

    function setMyBool(bool _myBool) public {
        myBool = _myBool;
    }


}
