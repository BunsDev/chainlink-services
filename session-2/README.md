## RegisterAccess Smart Contract Documentation

### 1. Introduction

#### 1.1 Purpose

The `RegisterAccess` smart contract is designed for managing a secure and modifiable list of information on the Ethereum
blockchain. It allows specific Ethereum addresses (in the allowlist) to add or modify information, while also providing
public visibility of the stored information and ownership.

#### 1.2 Scope

The contract is intended for use cases requiring controlled write access to a list of information with an audit trail (
via events) and read access for all.

---

### 2. Architecture

#### 2.1 Contract Overview

- **Contract Name:** RegisterAccess
- **Blockchain:** Ethereum
- **Language:** Solidity, Version 0.8.21

#### 2.2 State Variables

- `info`: Private array of strings, stores the list of information.
- `owner`: Public address of the contract owner, set at deployment.
- `allowlist`: Public mapping of addresses to booleans, indicating whether an address is allowed to modify `info`.

#### 2.3 Functions

- **Constructor:** Sets the contract deployer as the `owner` and adds them to the `allowlist`.
- **getInfo(uint):** Public view function to retrieve information by index.
- **setInfo(uint, string):** Public function to modify an existing entry in `info`, restricted to allowlist addresses.
- **addInfo(string):** Public function to add a new entry to `info`, restricted to allowlist addresses.
- **listInfo():** Public view function to list all entries in `info`.
- **addMember(address):** Public function for the owner to add a new address to the `allowlist`.
- **delMember(address):** Public function for the owner to remove an address from the `allowlist`.

#### 2.4 Modifiers

- **onlyOwner:** Restricts function access to the contract's owner.
- **onlyAllowlist:** Restricts function access to addresses in the `allowlist`.

#### 2.5 Events

- **InfoChange:** Emitted when an entry in `info` is modified, showing the old and new values.

---

### 3. Functional Specification

#### 3.1 Access Control

- The contract utilizes two levels of access control:
  - Owner: Can manage the `allowlist`.
  - Allowlisted Addresses: Can add or modify entries in `info`.

#### 3.2 Data Management

- **Adding Information:**
  - Any address in the `allowlist` can add new entries to `info`.
  - The new entry's index is returned.
- **Modifying Information:**
  - Any address in the `allowlist` can modify existing entries in `info`.
  - An event is emitted upon modification.
- **Reading Information:**
  - Any address can read entries in `info` or list all entries.

#### 3.3 Security and Ownership

- The contract employs `require` statements for access control, ensuring actions are performed by authorized addresses
  only.
- Ownership is transferrable by the owner to another address (functionality to be implemented if required).

---

### 4. Use Cases

- **Data Registry:** Suitable for applications needing a decentralized, modifiable data registry with controlled write
  access.
- **Access-Controlled Information Sharing:** Can be used in scenarios where information needs to be shared selectively
  and securely.

---

### 5. Limitations and Future Improvements

- Currently, the contract does not allow transferring ownership. This can be implemented if needed.
- Scalability might be an issue with a growing size of the `info` array, considering Ethereum's gas fees.

---

### 6. Appendices

#### 6.1 Deployment Guide

- Requirements: Solidity 0.8.21 compatible Ethereum environment.
- Deployment Steps: [Detailed steps for deployment on Ethereum network.]
