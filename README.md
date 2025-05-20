# 🔥 AUM Token - Custom ERC-20 Smart Contract

This project implements a custom ERC-20 token written in Solidity. It's a simple and beginner-friendly contract that can be deployed to Ethereum testnets like Sepolia or Goerli using tools like Remix, MetaMask, or Hardhat.

---

## 📌 Features

-  ✅ Total supply tracking
-  ✅ Account balance management
-  ✅ Token transfers
-  ✅ Allowance and approvals for delegated transfers
-  ✅ Compliant with the IERC20 interface

---

## 🛠️ How to Deploy (Using Remix + MetaMask)

1. Go to [Remix IDE](https://remix.ethereum.org)
2. Create a new `.sol` file and paste the contract code.
3. Compile the contract using Solidity version `0.8.20`.
4. Connect MetaMask to a testnet (e.g., Sepolia or Goerli).
5. Deploy the contract with:
   -  `name`: e.g. `"AUM Token"`
   -  `symbol`: e.g. `"AUM"`
   -  `decimals`: `18`
   -  `initialSupply`: `1000000` (1 million)

---

## 🧠 Function Details

### 🔹 `totalSupply()`

Returns the total number of tokens in circulation (including all holders).

### 🔹 `balanceOf(address account)`

Returns the number of tokens held by a specific address.

### 🔹 `transfer(address recipient, uint256 amount)`

Transfers tokens from the caller’s address to the recipient.

### 🔹 `allowance(address owner, address spender)`

Returns the number of tokens that `spender` is still allowed to withdraw from `owner`.

### 🔹 `approve(address spender, uint256 amount)`

Authorizes `spender` to withdraw tokens from your account up to the specified amount.

### 🔹 `transferFrom(address sender, address recipient, uint256 amount)`

Allows a third party (`spender`) to transfer tokens on behalf of the `sender` — only if approved.

---

## 📤 Events

### 🔸 `Transfer(address from, address to, uint256 value)`

Emitted when tokens are transferred between accounts.

### 🔸 `Approval(address owner, address spender, uint256 value)`

Emitted when approval is granted to a spender.

---

## 📦 Constructor Parameters

```solidity
constructor(
  string memory _name,
  string memory _symbol,
  uint8 _decimals,
  uint256 _initialSupply
)
```
