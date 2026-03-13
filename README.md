# 🥤 Vending Machine Smart Contract

A simple **Solidity smart contract** that simulates a vending machine where users can purchase soda using **ETH**.

This project demonstrates basic **Ethereum smart contract concepts** like:

* State variables
* Mappings
* Modifiers
* Events
* Payable functions
* Ownership control

---

# 📜 Smart Contract Overview

The **VendingMachine** contract allows users to:

* Buy soda by sending **1 ETH**
* Track how many sodas each user purchased
* Allow the **owner to refill stock**
* Allow the **owner to withdraw contract balance**

---

# ⚙️ Contract Features

### 1️⃣ Buy Soda

Users can purchase soda from the vending machine.

Requirements:

* Must send **exactly 1 ETH**
* Soda must be **in stock**

```solidity
function buy() public payable
```

When successful:

* Soda stock decreases
* Purchase is recorded
* Event is emitted

---

### 2️⃣ Refill Soda

Only the **owner** can refill the vending machine inventory.

```solidity
function fillSoda(uint _soda) public onlyOwner
```

Requirements:

* `_soda` must be greater than 0

---

### 3️⃣ Withdraw Balance

Allows the **owner** to withdraw ETH stored in the contract.

```solidity
function withdrawBalance() public onlyOwner
```

---

### 4️⃣ Check Contract Balance

Returns the ETH balance stored in the contract.

```solidity
function getBalance() public view returns(uint)
```

---

# 📦 State Variables

| Variable      | Type    | Description           |
| ------------- | ------- | --------------------- |
| soda          | uint    | Total sodas available |
| owner         | address | Contract owner        |
| sodaPurchased | mapping | Tracks user purchases |

---

# 📢 Events

Events allow frontend applications to track activity on the blockchain.

| Event            | Description                    |
| ---------------- | ------------------------------ |
| SodaPurchased    | Emitted when a soda is bought  |
| SodaRefilled     | Emitted when stock is refilled |
| BalanceWithdrawn | Emitted when ETH is withdrawn  |

---

# 🚀 How to Deploy (Using Remix)

1. Go to **https://remix.ethereum.org**
2. Create a new file

```
VendingMachine.sol
```

3. Paste the smart contract code
4. Compile the contract
5. Deploy using **Injected Provider (MetaMask)** or **Remix VM**

---

# 🧪 How to Test

### Buy Soda

1. Enter **1 ETH** in value field
2. Call `buy()`

### Refill Soda

Owner calls:

```
fillSoda(10)
```

### Withdraw Balance

```
withdrawBalance()
```

---

# 🛠 Tech Stack

* **Solidity ^0.8.20**
* **Ethereum**
* **Remix IDE**

---

# 📂 Project Structure

```
VendingMachine-SmartContract
│
├── contracts
│   └── VendingMachine.sol
│
└── README.md
```

---

# 👨‍💻 Author

**Ujjwal Singh**

Computer Science Engineer interested in:

* Blockchain Development
* Smart Contracts
* Web3

---

# ⭐ Future Improvements

Possible improvements for this project:

* Add **ERC20 token payment**
* Add **frontend (React + ethers.js)**
* Add **Hardhat tests**
* Add **inventory price control**
