## Chainlink Bootcamp Showcase: Leveraging Blockchain Oracles & Automation

This repository showcases a suite of smart contracts that demonstrate the following key Chainlink services:

* **Chainlink Price Feeds:**  Contracts access accurate, up-to-date price data across blockchains to inform dynamic NFT
  behaviors.
* **Chainlink Automation:** Automated contract execution ensures the timely update of NFTs, streamlining a core
  application process.
* **Chainlink VRF:**   Contracts gain verifiable randomness for fair and unpredictable gaming mechanisms.
* **Cross-Chain Interoperability Protocol (CCIP):** Enabling smart contracts across different blockchains to communicate
  and trigger functionality remotely.

## Featured Projects

1. **CrossChainPriceNFT.sol**

    * **Dynamic NFT Powered by Price Feeds:** The NFT's image and associated metadata change based on live crypto price
      data retrieved from Chainlink Price Feeds.
    * **Cross-Chain Minting:** Initial minting on Sepolia triggers updates to the visual of the NFT and enables minting
      in different chains thanks to CCIP.
    * **Deployed on:** Sepolia

2. **RunnersV2.sol**

    * **Chainlink VRF Racing Game:**  NFT characters participate in races where progress is influenced by secure random
      numbers from Chainlink's VRF.
    * **Evolving Attributes:** Each race updates the NFT's statistics and metadata, showcasing its progression.
    * **Deployed on:** Fuji

3. **PhotoAlbum.sol**

    * **Time-Lapse, Evolving Photo NFT:** This NFT depicts a sequence of images based on configurable time intervals.
    * **Chainlink Automation Integration:**  Chainlink Automation handles periodic photo changes as dictated by the
      pre-determined time intervals.
    * **Deployed on:** Sepolia

## Project Highlights:

* **Real-World Relevance:** The `CrossChainPriceNFT.sol` demonstrates tangible potential for NFTs mirroring the evolving
  prices of real-world assets.
* **Game Mechanics Innovation:** `RunnersV2.sol` exemplifies how the combination of Chainlink VRF and dynamic NFTs
  allows for a unique class of provably fair, on-chain games.
* **Interactive NFTs:** `PhotoAlbum.sol` showcases the use of Chainlink Automation to add a layer of interaction and
  evolution to NFTs over time.

## Additional Learning Resources

* **Chainlink Docs:** [https://docs.chain.link](https://docs.chain.link)
* **Chainlink Twitter:** [https://twitter.com/chainlink](https://twitter.com/chainlink)

## Project Setup & Deployment

1. **Environment:** Refer to the individual project README files for environment and network requirements.
2. **Dependencies:**  Install OpenZeppelin libraries for essential NFT utilities by
   running  `npm install @openzeppelin/contracts`.
3. **Chainlink Interactions:** You'll need test tokens and active accounts on testnets to interact with the deployed
   contracts.

4. **Deployment:** Consult specific project instructions as contracts are designed for distinct blockchains and require
   network-specific considerations.

## Project Potential and Future Extensions

The projects featured in this showcase lay a strong groundwork for the following expansions:

* **Diverse Oracles:**  Explore data beyond price feeds, introducing Chainlink sports data, weather data, and more.
* **Advanced NFT Behavior:** Develop NFTs with actions responding to external events in the real world or within other
  smart contracts.
* **Multi-Chain Expansions:** Experiment with Cross-Chain functionality across a broader range of blockchains.
* **User Interface Development:** Create a user-friendly DApp (Decentralized Application) to visualize and interact with
  your dynamic NFTs seamlessly.

