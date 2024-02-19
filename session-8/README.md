## Overview

The `RunnersV2.sol` contract introduces an exciting NFT system where dynamically generated characters engage in
competitive runs powered by Chainlink's Verifiable Random Function (VRF). This improved iteration incorporates crucial
refinements making it more efficient and user-friendly than its predecessor.

## Key Features

* **ERC-721 NFT Standard:** Adheres to the widely-adopted ERC-721 standard, guaranteeing fundamental functionalities
  like ownership, transferability, and metadata.
* **Chainlink VRF Integration:**  Employs Chainlink's VRF to inject secure randomness into the NFT generation process,
  ensuring unpredictable and fair outcomes for participants.
* **Dynamic NFT Updates:** NFT attributes and visuals evolve after each race, making them genuinely dynamic and
  responsive to on-chain randomness.
* **Multiple Characters to Choose:**  Offers a selection of character types, expanding upon the single default character
  from the original implementation.

## Improvements Over `Runners.sol`

* **Customizable Characters:** `RunnersV2.sol` adds the flexibility for users to select between character types when
  minting a new runner. This provides players with greater personalization, making the game more engaging.
* **Refined Token Metadata:** The token metadata generation (the JSON that powers the NFT artwork and descriptive
  traits) incorporates the runner's chosen character name into its description. This small improvement helps with NFT
  differentiation based on the selected character.

## Functionality

1. **Minting:**
    * Users choose from a range of available character types (Elf, Knight, Orc, Witch).
    * An instance of the `Runner` struct is created, storing the character's name, image, initial distance (0), and
      round.
    * An ERC-721 token is minted, and its metadata is generated dynamically, with attributes dependent on the selected
      character.

2. **Running:**
    * Users trigger the `run` function associated with their runner NFT.
    * The contract requests a random number from the Chainlink VRF.
    * The VRF responds with a secure random number, and the `fulfillRandomWords` callback function is triggered.
    * The runner's distance attribute is updated based on the received random number.
    * The NFT's metadata is regenerated to reflect the character's advancement.

## Deployment

1. **Fuji Network:**  Deploy the `RunnersV2.sol` contract on the Fuji Testnet.
2. **Chainlink VRF Subscription:** Create and fund a VRF subscription on the Fuji Testnet, providing LINK tokens to
   cover the randomness fees.
3. **Contract Configuration:** During deployment, set the `s_subscriptionId` to the ID of your created subscription.

## Considerations

* **VRF Subscription**: Maintain adequate LINK balance in your Chainlink VRF subscription to prevent service
  interruptions.
* **Gas Consumption:** Factor in gas cost fluctuations when triggering actions that depend on Chainlink VRF.

