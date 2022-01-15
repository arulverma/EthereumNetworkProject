// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "./PkmnHelper.sol";

abstract contract PkmnBattle is PkmnHelper
{
    //add randomness checks -> TODO!
    function battle(uint user, uint enemy) public returns(uint256) 
    {
        Pkmn storage myPkmn = pokemons[user];
        Pkmn storage EnemyPkmn = pokemons[enemy]; 

        if(myPkmn.faint == true) return 0;

        if((myPkmn.hp / EnemyPkmn.atk_stat) >= (EnemyPkmn.hp / myPkmn.atk_stat)) 
        {
            _level_up(user);
            return 1;
        }
        else
        {
            myPkmn.faint = true;
            return 0;
        }
    }

    function revive(uint user) public payable returns(uint)
    {
        if(pokemons[user].faint == false)
        { 
            return 0;
        }
        else {
            require(msg.value == 0.00001 ether);
            pokemons[user].faint = false;
            return 1;
        }
    }

    function random() private view returns (uint) {
        uint rand = 0;
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, rand)));
    }

    function level_up(uint user) public payable
    {
        require(msg.value == 0.001 ether);
        pokemons[user].level++;
        _level_up(user);
    }

    function _level_up(uint user) public returns (uint) 
    {
        if(pokemons[user].level == 100) return 0;

        pokemons[user].hp = pokemons[user].hp + random()%41;
        pokemons[user].atk_stat = pokemons[user].atk_stat + random()%8;
        pokemons[user].faint = false;
        return 1;
    }
}