// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

//import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "./PkmnBattle.sol";

//Pokemon Token?

contract TestToken is PkmnBattle
{
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("TestToken", "Pkmn") { }

    function _baseURI() internal view override returns(string memory)
    {
       return("ipfs://"); 
    }

    function tokenURI(uint tokenID) public view virtual override returns(string memory){
        return string(abi.encodePacked(super.tokenURI(tokenID), ".json"));
    }

    function mint(address user, string memory tokenURI) public returns (uint256){
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        _mint(user, newItemId);
        _setTokenURI(newItemId, string(abi.encodePacked(_baseURI(), tokenURI)));
        return newItemId;
    }
    
}