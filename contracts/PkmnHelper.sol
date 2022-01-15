// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

abstract contract PkmnHelper is ERC721URIStorage
{
    event newPkmn(uint id, string name);

    struct Pkmn {
        string name;
        uint256 hp;
        uint256 atk_stat;
        uint256 level;
        bool faint;
        //implement typing bonuses and speed? -> TODO!
        //implement base stats -> TODO!
    }

    Pkmn[] public pokemons;
    mapping (uint => address) public PkmnToTrainer;

    function createPkmn(string memory _name) internal returns(uint)
    {
        pokemons.push(Pkmn(_name,20, 2, 1, false)); 
        uint id = pokemons.length - 1;
        PkmnToTrainer[id] = msg.sender;
        emit newPkmn(id, _name);
        return id;
    }

    function rename(uint user, string memory new_name) public
    {
        pokemons[user].name = new_name;
    }
}