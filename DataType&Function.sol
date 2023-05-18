// SPDX-License-Identifier: MIT
pragma solidity >0.7.0 <0.9.0;
contract zombieFactory{
    event zombieAdd (string _name, uint _dna);
    uint dnaDigits = 16;
    uint dnaModule = 10 ** dnaDigits;
    struct zombie{
        string name; 
        uint dna;
    }
    enum level {start,medium,pro}
    zombie[] public zombies;
    function _createZombie( string memory _name, uint  _dna) private{
        zombies.push(zombie(_name,_dna));
    }

    function _generateRandomDNA(string memory _name) private view returns(uint){
        uint rand = uint (keccak256(abi.encodePacked(_name)));
        return rand % dnaModule;
    }
    function createRandomZombie(string memory _name) public {
        uint randDna = _generateRandomDNA(_name);
        emit zombieAdd(_name,randDna);
        _createZombie(_name, randDna);
    }

    zombieFactory.createRandomZombie(function(error, result)){
        
    }
    

}
