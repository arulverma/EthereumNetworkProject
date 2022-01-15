# EthereumNetworkProject
I created a NFT smart contract for Pokemon for fun. Currently, the contract needs to be deployed manually using Truffle and can be accessed using the Ganache CLI. This contract uses Solidity version 0.8.10 (must be the exact version of solidity running), and requires the installation of OpenZepellin contracts as those are unable to be uploaded to Github.

I am looking to make this NFT deploy automatically over the next few weeks using JavaScript.

# Breakdown
I used the ERC721 standard as the basis for the smart contract. I built 3 different helper contrats for the main TestToken. These will serve as an intermediary that hold many of the actions that the token can do. The end goal is to make the token able to automatically mint random pokemon with stats and to make these pokemon battle.
