pragma solidity ^0.8.7;

contract Owned {
    address owner;

    modifier onlyOwner {
        require(msg.sender == owner, "You are not allowed!");
        _;
    }

    constructor() {
        owner = msg.sender;
    }
}
