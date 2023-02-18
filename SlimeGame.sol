// SPDX-License-Identifier: MIT


pragma solidity ^0.8.13;

contract SlimeGame {

    constructor() {
        address owner = msg.sender;
    }

    uint cooldownValue = 1 days;

    struct Slime {
        string name;
        uint level;
        uint cooldown;
    }
    mapping (string => address) public ownerOfSlime;
    mapping (address => uint) public slimeCount;
    mapping (address => uint) public OneXpBottles;
    mapping (address => uint) public TwoXpBottles;
    Slime[] public SlimesList;

    function createSlime(string memory name) public {
        require(slimeCount[msg.sender] == 0);
        SlimesList.push(Slime(name, 1, uint32(block.timestamp + cooldownValue)));
        ownerOfSlime[name] = msg.sender;
        slimeCount[msg.sender] += 1;
    }
}