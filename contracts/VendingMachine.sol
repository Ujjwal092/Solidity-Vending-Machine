// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
    Vending Machine Smart Contract
    Features:
    1. Users can buy soda by paying 1 ETH.
    2. Owner can refill soda inventory.
    3. Owner can withdraw contract balance.
    4. Events are emitted for important actions.
*/

contract VendingMachine {

    // Total soda available in the vending machine
    uint public soda;

    // Owner of the contract
    address public owner;

    // Tracks how many sodas each address has purchased
    mapping(address => uint) public sodaPurchased;

    /*
        Events
        ------
        Events are logged on the blockchain and can be used by
        frontend applications to track contract activity.
    */

    // Emitted when someone buys soda
    event SodaPurchased(address indexed buyer, uint amount);

    // Emitted when soda stock is refilled
    event SodaRefilled(uint amount);

    // Emitted when owner withdraws ETH
    event BalanceWithdrawn(address indexed owner, uint amount);


    /*
        Modifier
        --------
        Used to restrict certain functions so that
        only the contract owner can call them.
    */
    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }


    /*
        Constructor
        -----------
        Runs only once when the contract is deployed.
        Sets initial soda stock and owner address.
    */
    constructor() {
        soda = 100;              // Initial stock
        owner = msg.sender;      // Deployer becomes owner
    }


    /*
        Buy Soda
        --------
        Users must send exactly 1 ETH to buy one soda.
    */
    function buy() public payable {

        // Ensure correct payment
        require(msg.value == 1 ether, "You should pay exactly 1 ETH");

        // Ensure vending machine has stock
        require(soda > 0, "Out of stock");

        // Record purchase
        sodaPurchased[msg.sender] += 1;

        // Reduce soda inventory
        soda -= 1;

        // Emit event
        emit SodaPurchased(msg.sender, 1);
    }


    /*
        Refill Soda
        -----------
        Only the owner can refill soda inventory.
    */
    function fillSoda(uint _soda) public onlyOwner { //we used onlyOwner modifier here

        require(_soda > 0, "Refill amount must be greater than 0");

        soda += _soda;

        emit SodaRefilled(_soda);
    }


    /*
        Withdraw Contract Balance
        -------------------------
        Allows owner to withdraw all ETH stored in contract.
    */
    function withdrawBalance() public onlyOwner {

        uint balance = address(this).balance;

        require(balance > 0, "No balance to withdraw");

        payable(owner).transfer(balance);

        emit BalanceWithdrawn(owner, balance);
    }


    /*
        Helper Function
        ---------------
        Returns current contract balance.
    */
    function getBalance() public view returns(uint) {
        return address(this).balance; //view means read only
    }
}

