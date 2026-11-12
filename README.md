# MiniSocial — Decentralized Social Network

## 1. Project Overview

**MiniSocial** is a simple decentralized social network developed using Solidity and deployed on the Ethereum Sepolia test network.

The main objective of this project is to understand the fundamental concepts of blockchain development and smart contracts.

The application allows users to publish messages directly on the blockchain. Each publication is associated with the Ethereum wallet address of its author. Users can also retrieve previously published messages and check the total number of publications.

Unlike traditional social networks, where data is generally stored on centralized servers, MiniSocial stores its publications in a smart contract deployed on Ethereum.

**Project:** Atelier 3 — Smart Contract Mini Réseau Social  
**Smart contract:** MiniSocial  
**Programming language:** Solidity  
**Blockchain:** Ethereum Sepolia Testnet  
**Development environment:** Remix IDE  
**Wallet:** MetaMask

---

## 2. Project Objectives

The main objectives of this project are:

- Understand the role of smart contracts in blockchain technology.
- Learn the fundamentals of Solidity programming.
- Define and use structures (`struct`) in Solidity.
- Store data using dynamic arrays.
- Understand how Ethereum transactions work.
- Identify users through their wallet addresses.
- Deploy a smart contract on the Ethereum Sepolia test network.
- Interact with a deployed smart contract using Remix IDE and MetaMask.
- Test smart contract functions using different Ethereum accounts.

---

## 3. Technologies and Tools

### 3.1 Solidity

Solidity is a programming language designed for writing smart contracts that run on Ethereum-compatible blockchains.

In this project, Solidity is used to define the MiniSocial contract, its data structure, and its functions.

### 3.2 Remix IDE

Remix is an online development environment for Solidity.

It is used to:

- Create and edit Solidity files.
- Compile smart contracts.
- Deploy contracts to blockchain networks.
- Interact with deployed contracts.
- Execute functions and inspect their results.

Website: https://remix.ethereum.org/

### 3.3 MetaMask

MetaMask is an Ethereum wallet used to manage blockchain accounts and authorize transactions.

In this project, MetaMask is used to:

- Connect Remix to an Ethereum account.
- Select the Sepolia network.
- Authorize smart contract deployment.
- Confirm transactions when publishing messages.
- Identify the author of each publication through the wallet address.

Website: https://metamask.io/

### 3.4 Ethereum Sepolia

Sepolia is an Ethereum test network used to develop and test decentralized applications without spending real ETH.

The project is deployed on Sepolia using test ETH.

Network information:

| Parameter | Value |
|---|---|
| Network | Ethereum Sepolia |
| Chain ID | 11155111 |
| Currency | SepoliaETH |
| Explorer | https://sepolia.etherscan.io |

### 3.5 GitHub

GitHub is used to host the project's source code and documentation, making the project accessible and easier to maintain.

Repository: `MiniSocial-Smart-Contract`

---

## 4. Smart Contract Architecture

The MiniSocial smart contract contains three main elements:

1. A structure called `Post`.
2. A dynamic array called `posts`.
3. Three functions for publishing and retrieving publications.

### 4.1 Post Structure

The `Post` structure defines the information associated with each publication.

```solidity
struct Post {
    string message;
    address author;
}
```

It contains two attributes:

- `message`: Stores the text written by the user.
- `author`: Stores the Ethereum wallet address of the user who published the message.

Each publication therefore contains its message and its author's address.

### 4.2 Dynamic Array

```solidity
Post[] public posts;
```

The `posts` array stores all publications created through the smart contract.

It is a dynamic array, which means that its size can increase whenever a new publication is added.

Each publication is assigned an index:

| Index | Publication |
|---|---|
| 0 | First publication |
| 1 | Second publication |
| 2 | Third publication |
| ... | ... |

The `public` keyword also automatically creates a getter that allows users to retrieve individual array elements.

---

## 5. Complete Smart Contract Code

The following code implements the MiniSocial application.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MiniSocial {

    struct Post {
        string message;
        address author;
    }

    Post[] public posts;

    function publishPost(string memory _message) public {
        Post memory newPost = Post({
            message: _message,
            author: msg.sender
        });

        posts.push(newPost);
    }

    function getPost(uint index)
        public
        view
        returns (string memory, address)
    {
        Post memory post = posts[index];
        return (post.message, post.author);
    }

    function getTotalPosts() public view returns (uint) {
        return posts.length;
    }
}
```

---

## 6. Detailed Code Explanation

### 6.1 License Identifier

```solidity
// SPDX-License-Identifier: MIT
```

This line specifies the software license associated with the smart contract.

The MIT license allows others to use, modify, and distribute the code under its terms.

### 6.2 Solidity Version

```solidity
pragma solidity ^0.8.20;
```

This instruction specifies the Solidity compiler version.

The `^` symbol means that compatible compiler versions starting from 0.8.20 can be used, provided they remain below 0.9.0.

### 6.3 Contract Declaration

```solidity
contract MiniSocial {
```

This declares a smart contract named `MiniSocial`.

A smart contract contains variables and functions that define its behavior on the blockchain.

### 6.4 Publishing a Message

```solidity
function publishPost(string memory _message) public {
    Post memory newPost = Post({
        message: _message,
        author: msg.sender
    });

    posts.push(newPost);
}
```

This function allows a user to publish a new message.

**Step-by-step explanation:**

1. The function receives a string parameter called `_message`.
2. A new `Post` structure is created.
3. The message is assigned to the `message` attribute.
4. The `msg.sender` instruction retrieves the address of the wallet calling the function.
5. The new publication is added to the `posts` array using `push()`.

The `msg.sender` variable is particularly important because it automatically identifies the Ethereum account that executes the transaction.

**Example:**

If Account 1 publishes:

`Hello everyone! Welcome to MiniSocial.`

The contract stores:

- Message: `Hello everyone! Welcome to MiniSocial.`
- Author: Account 1 wallet address.

### 6.5 Retrieving a Publication

```solidity
function getPost(uint index)
    public
    view
    returns (string memory, address)
{
    Post memory post = posts[index];
    return (post.message, post.author);
}
```

This function retrieves a publication using its index in the array.

**Parameters:**

- `index`: The position of the publication in the `posts` array.

**Return values:**

- The message.
- The author's Ethereum address.

The `view` keyword indicates that this function reads blockchain data without modifying the contract's state.

For example:

```solidity
getPost(0)
```

Returns the first publication.

### 6.6 Counting Publications

```solidity
function getTotalPosts() public view returns (uint) {
    return posts.length;
}
```

This function returns the total number of publications stored in the array.

The expression `posts.length` gives the current number of elements in the array.

For example:

| Number of publications | Returned value |
|---|---:|
| No publications | 0 |
| One publication | 1 |
| Two publications | 2 |
| Three publications | 3 |

This function is also marked `view` because it only reads data.

---

## 7. Smart Contract Deployment

The smart contract was developed, compiled, and deployed using Remix IDE.

### Step 1 — Create the Solidity File

1. Open Remix IDE.
2. Create a new file named `MiniSocial.sol`.
3. Paste the complete smart contract code into the file.

### Step 2 — Compile the Contract

1. Open the Solidity Compiler section.
2. Select a compatible compiler version, such as 0.8.20.
3. Click **Compile MiniSocial.sol**.
4. Verify that compilation completes successfully.

### Step 3 — Connect MetaMask

1. Open MetaMask.
2. Select the Ethereum Sepolia network.
3. Connect MetaMask to Remix.
4. Select the account that will deploy the contract.

### Step 4 — Deploy the Contract

1. Open the Deploy & Run Transactions section in Remix.
2. Select **Injected Provider - MetaMask**.
3. Verify that the selected network is Sepolia.
4. Select the `MiniSocial` contract.
5. Click **Deploy**.
6. Confirm the transaction in MetaMask.

After successful deployment, Remix displays the deployed contract under **Deployed Contracts**.

The smart contract now has its own blockchain address.

---

## 8. Smart Contract Testing

The contract must be tested to verify that its functions work correctly.

### Test 1 — Publish a Message from Account 1

Use the first MetaMask account.

Call:

```solidity
publishPost("Hello everyone! Welcome to MiniSocial.")
```

Confirm the transaction in MetaMask.

Expected result:

- A new publication is added.
- The message is stored in the `posts` array.
- The author's address corresponds to Account 1.

### Test 2 — Publish a Message from Account 2

Switch to a second MetaMask account.

Reconnect Remix using the second account, while keeping the same deployed contract selected.

Call:

```solidity
publishPost("Welcome to our decentralized social network!")
```

Confirm the transaction.

Expected result:

- A second publication is added.
- Its author is Account 2.
- The two publications have different author addresses if two different accounts were used.

### Test 3 — Retrieve the First Publication

Call:

```solidity
getPost(0)
```

Expected result:

- The first message.
- The wallet address of Account 1.

### Test 4 — Retrieve the Second Publication

Call:

```solidity
getPost(1)
```

Expected result:

- The second message.
- The wallet address of Account 2.

### Test 5 — Count Publications

Call:

```solidity
getTotalPosts()
```

Expected result after two successful publications:

```text
2
```

### Test Summary

| Test | Function | Expected result |
|---|---|---|
| Publish from Account 1 | `publishPost()` | First post created |
| Publish from Account 2 | `publishPost()` | Second post created |
| Retrieve first post | `getPost(0)` | First message and author |
| Retrieve second post | `getPost(1)` | Second message and author |
| Count publications | `getTotalPosts()` | 2 |

*The expected results above describe the test procedure. Include your actual screenshots and transaction results as evidence in the repository.*

---

## 9. Blockchain Interaction and Transactions

When a user publishes a message, the operation is executed as a blockchain transaction.

The process is:

1. The user calls `publishPost()`.
2. MetaMask requests transaction authorization.
3. The user confirms the transaction.
4. The transaction is transmitted to the Sepolia network.
5. Validators process the transaction.
6. The smart contract executes the function.
7. The new publication is stored in the contract's state.

Publishing a message requires test ETH to pay the transaction's gas fee.

Reading data through `view` functions does not require sending a blockchain transaction when called as a read-only operation.

---

## 10. Project Structure

The GitHub repository should have the following structure:

```text
MiniSocial-Smart-Contract/
│
├── contracts/
│   └── MiniSocial.sol
│
├── screenshots/
│   ├── compilation.png
│   ├── deployment.png
│   ├── account1-publication.png
│   ├── account2-publication.png
│   ├── first-post.png
│   ├── second-post.png
│   └── total-posts.png
│
├── report/
│   └── MiniSocial-Technical-Report.pdf
│
└── README.md
```

The `contracts` directory contains the Solidity source code.

The `screenshots` directory contains evidence of compilation, deployment, and testing.

The `report` directory contains the detailed technical report.

---

## 11. Advantages of the Application

MiniSocial demonstrates several advantages of blockchain-based applications:

- **Decentralization:** Publications are stored in a smart contract instead of a traditional centralized database.
- **Transparency:** Contract data can be inspected on the blockchain.
- **Traceability:** Each publication is associated with the wallet address of its author.
- **Persistence:** Stored publications remain in the contract's state.
- **Public accessibility:** Anyone can read the available publications.
- **Smart contract automation:** Publication logic is executed automatically by the blockchain.

---

## 12. Current Limitations

This project is an educational prototype and does not implement all the features of a complete social network.

Current limitations include:

- No user profiles or registration system.
- No editing or deleting publications.
- No likes or comments.
- No private messaging.
- No frontend interface for end users.
- No moderation or content filtering.
- No maximum message length.
- No pagination for retrieving large numbers of publications.

Furthermore, the messages and author addresses are publicly accessible on the blockchain. Users should not publish confidential or sensitive information.

---

## 13. Possible Future Improvements

The application could be extended with additional features:

1. Add user profiles linked to Ethereum wallet addresses.
2. Implement likes and comments.
3. Add timestamps to publications.
4. Add a frontend using React or Next.js.
5. Connect the frontend to the smart contract using Ethers.js or Viem.
6. Add events to notify applications when new publications are created.
7. Implement pagination to improve performance when displaying many publications.
8. Add moderation mechanisms to manage inappropriate content.

These improvements could transform the current smart contract into a more complete decentralized social network.

---

## 14. Conclusion

The MiniSocial project provides a practical introduction to smart contract development using Solidity and Ethereum.

Through this project, we learned how to define data structures, store information in dynamic arrays, create functions that modify blockchain state, and retrieve stored data.

We also learned how to compile and deploy a smart contract using Remix IDE, connect an Ethereum wallet through MetaMask, and test the application on the Sepolia test network.

The project demonstrates how blockchain technology can be used to build decentralized applications where publications are publicly accessible and associated with their authors' wallet addresses.

**MiniSocial represents a first step toward understanding the development of decentralized applications (DApps) on Ethereum.**
