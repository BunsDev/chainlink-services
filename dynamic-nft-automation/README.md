## Project Overview

This repository contains a Solidity smart contract, `PhotoAlbum.sol`, designed to create a dynamic NFT representing a
photo album. The photo within the album will change at pre-determined intervals using Chainlink Automation.

## Key Features

* **Dynamic NFT with Chainlink Automation:** The NFT's visual representation (stored as a token URI on IPFS)
  automatically updates over time as facilitated by Chainlink Automation. This eliminates manual intervention and makes
  the NFT inherently interactive.
* **IPFS for Metadata:** Token metadata, representing the different stages of the photo album, is stored on IPFS to
  ensure decentralized and immutable storage.
* **ERC-721 Compatibility:** The contract adheres to the ERC-721 standard for non-fungible tokens, guaranteeing basic
  functionalities like ownership and transferability.
* **Token Burning:** The implemented `_burn` function allows the destruction of tokens according to ERC-721 logic.

## Contract Logic

1. **Minting:** Upon deployment, an initial NFT is minted, and its image is set to the first stage (photo01) from the
   pre-defined set of IPFS links.
2. **Image Rotations:**
    * The `photoAlbumIndex` function determines the current image associated with a token based on its token URI.
    * The `rotatePhoto` function updates the NFT's token URI to the next image in the series if the current image isn't
      the last stage.
3. **Chainlink Automation**
    * **`checkUpkeep`:**  Determines if enough time (`interval`) has elapsed since the last image update. If so, and the
      NFT has not reached the final image, it signals the need for automation.
    * **`performUpkeep`:** If conditions are met, this function triggers the `rotatePhoto` function to transition the
      NFT image to the next stage.

## Dependencies

* **OpenZeppelin Contracts:**   ([https://openzeppelin.com/contracts/](https://openzeppelin.com/contracts/)) Provides
  the ERC-721 implementation.
* **Chainlink Automation:
  **  ([https://docs.chain.link/docs/chainlink-automation/introduction/](https://docs.chain.link/docs/chainlink-automation/introduction/))
  For scheduling image updates on-chain.

## Deployment

1. Install dependencies: `npm install @openzeppelin/contracts @chainlink/contracts`
2. Populate the `IPfsUri` array with links to your image assets on IPFS.
3. Set the desired `interval` for image changes.
4. Deploy the `PhotoAlbum.sol` contract.
5. Register the deployed contract for Chainlink Automation to facilitate timed updates.

## Notes

* You **must** set up and fund a Chainlink Automation upkeep for the NFT updates to execute automatically.
* Consider adjusting the code and IPFS URIs to match your desired photo series and visual preferences.

## License

This project is licensed under the MIT License.

**Important Considerations:**

* **IPFS Pinning:**  Ensure your IPFS image metadata remains readily available.
* **Chainlink Network and Subscription:** Remember that this depends on Chainlink Automation functionalities which need
  to be deployed on your chosen blockchain network and that you maintain a funded subscription balance.
