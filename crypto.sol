// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract UjjwalCoin{
    //har kisi adddress ke pass kitna balnce h 
    mapping(address => uint) public balance;
    address public owner;
    
    modifier onlyOwner() {
        require(owner == msg.sender , "You are not owner");
        _;
    }
    constructor(){
        owner = msg.sender; //deployer of the contract
        balance[msg.sender] = 1000; //balance of sender 1000
    }

    //minting the token
    function mint(uint amount) public onlyOwner{
        balance[owner] += amount; //balance of owner will be increase by amount
    }

//sender sending to some address 
    function transfer(address _to, uint amount) public {
        //check balance of sender is there or not
        require(balance[msg.sender] >= amount, "Insufficient balance"); 
        //if balance is less than amount then only it will throw error]);
        balance[msg.sender] -= amount; //balance of sender will be decrease by amount
        balance[_to] += amount; //balance of receiver will be increase by amount
    }

    }
