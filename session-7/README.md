## Overview

This project contains Solidity smart contracts enabling the minting of NFTs based on data originating from different
blockchains. The core principles powering this solution are:

* **Cross-Chain Interoperability Protocol (CCIP)**: ([https://chain.link/ccip](https://chain.link/ccip)) Facilitates
  secure cross-chain communication, providing the foundation for transferring NFT minting instructions across networks.
* **Chainlink Routers:**  Specialized Chainlink network infrastructure designed as gateways for cross-chain messaging
  via CCIP.
* **LINK Token:** Utilized as the currency to compensate Chainlink nodes for facilitating cross-chain transactions.

## Architecture

The system consists of three primary smart contracts deployed on three distinct chains:

**1. CrossChainPriceNFT.sol (Deployed on Sepolia)**

* **Dynamic NFT:** Represents the core NFT asset whose visuals change based on price feed updates acquired from a
  different blockchain.
* **ERC-721 Implementation:**  Adherence to the standard for non-fungible tokens.
* **Chainlink Price Feeds:** Leverages Chainlink's secure oracles to obtain crypto asset price data for triggering and
  rendering NFT alterations.
* **SVG Composition:** Generates and embeds SVG-based graphics containing information on the source chain and asset
  prices within the NFT metadata.

**2. CrossDestinationMinter.sol (Deployed on Sepolia)**

* **CCIP Receiver:** Implements logic to process received messages and execute mint instructions sent by the source
  contracts.
* **Contract Interface Alignment:** Maintains an external interface in conformity with the source contracts to simplify
  call forwarding.

**3. CrossSourceMinter.sol (Deployed on Fuji and Mumbai)**

* **CCIP Sender:** Responsible for initiating cross-chain NFT minting requests.
* **Message Composition:** Packages the `mintFrom()` function call, alongside the necessary arguments, into a
  CCIP-compatible message.
* **Fee Estimation:**  Integrates with the Chainlink router to calculate and cover transaction fees incurred when
  communicating across chains.

## Deployment

Before deployment, remember to:

1. **Customize Router & Network Addresses:** Ensure addresses in `CrossSourceMinter.sol` correctly match the Chainlink
   routers on their respective target blockchains.
2. **Fund CrossSource Contracts:**  Transfer an ample supply of LINK to the `CrossSourceMinter` contracts to fuel the
   cross-chain transactions through the Chainlink network.

## Interactions

1. **Minting Trigger:** Users initiate the minting process on the Fuji or Mumbai network by interacting with the
   corresponding `CrossSourceMinter` contracts.
2. **Message Relay:**  `CrossSourceMinter` uses the Chainlink Router to transmit a CCIP message to the Sepolia network,
   carrying instructions for the NFT mint.
3. **Minting Execution:** The `CrossDestinationMinter` contract on Sepolia receives the message via CCIP and executes
   the `mintFrom()` function of the `CrossChainPriceNFT` contract, updating the NFT metadata with data originating from
   the original chain.

## Considerations

* **Chainlink CCIP:** The project depends on the continued operation of Chainlink's CCIP infrastructure across the
  supported networks.
* **LINK Token Supply:**  Sufficient LINK balance must be available in the source contracts to settle costs involved in
  forwarding messages.
