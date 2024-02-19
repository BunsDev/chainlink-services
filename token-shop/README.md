## Project Overview

This repository contains two Solidity smart contracts:

* **TokenShop.sol:** A contract enabling purchases of a custom ERC-20 token using ETH. The price of the token is
  determined dynamically using a Chainlink price feed (ETH/USD).
* **Token.sol:**  A basic ERC-20 token contract with minting functionality and access control.

## Key Features

**TokenShop.sol**

* **Integration with Chainlink Price Feeds:** Leverages Chainlink's ETH/USD price feed on the Sepolia testnet for
  real-time pricing.
* **Dynamic Token Pricing:** Automatically calculates the number of tokens to be issued based on the provided ETH value
  and current ETH/USD exchange rate.
* **Custom Token Minting:**  Mints new tokens using a linked external Token contract.
* **Ownership and Withdrawal:** Includes an `onlyOwner` modifier for restricted functions and a `withdraw` function
  allowing the owner to retrieve collected ETH.

**Token.sol**

* **Standard ERC-20 Implementation:** Follows the ERC-20 token standard, providing fundamental functionalities like
  balance inquiries and transfers.
* **Minter Role:** Employs access control with a dedicated `MINTER_ROLE` to manage token minting permissions.
* **Custom Decimals:** Configured for two decimal places to suit the token economics of the project.

## Dependencies

* **OpenZeppelin Contracts:**  ([https://openzeppelin.com/contracts/](https://openzeppelin.com/contracts/)) Provides the
  ERC-20 implementation and access control.
* **Chainlink Price Feeds (Sepolia Testnet):
  ** ([https://docs.chain.link/docs/data-feeds](https://docs.chain.link/docs/data-feeds)) Fetches the current ETH/USD
  price.

## Deployment

1. Install dependencies: `npm install @openzeppelin/contracts @chainlink/contracts`
2. Make sure you have sufficient test ETH on the Sepolia network.
3. Update the Chainlink price feed address in `TokenShop.sol` if needed.
4. Deploy `Token.sol` first
5. Deploy `TokenShop.sol`, providing the deployed address of `Token.sol` in the constructor.

## Usage

* Users can send ETH to the `TokenShop.sol` contract's receive function.
* The contract will automatically calculate and mint the appropriate amount of tokens based on the current ETH/USD
  exchange rate.

## Notes

* These contracts are designed for the Sepolia testnet. Adapt for other networks by changing the Chainlink oracle
  address.
* This is a simplified example. Production contracts would require thorough testing and security audits.
