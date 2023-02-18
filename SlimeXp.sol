// SPDX-License-Identifier: MIT


pragma solidity ^0.8.13;
import "./SlimeGame.sol";

contract SlimeXp is SlimeGame{
    
    uint neededXpBottles = 1;
    uint LvlUpFee = 0.001 ether;

    function Give1Xp(Slime memory targetSlime) public view {
        require(msg.sender == ownerOfSlime[targetSlime.name], "This is not your slime.");
        require(targetSlime.level < 10, "Your slime is max level (try to split him ^^).");
        require(OneXpBottles[msg.sender] >= neededXpBottles, "You need an xp bottle to do this.");
        targetSlime.level += 1;
    }

    function Give2Xp(Slime memory targetSlime) public view {
        require(msg.sender == ownerOfSlime[targetSlime.name], "This is not your slime.");
        require(targetSlime.level < 9, "Please use a '1 xp' to reach the max level of your slime.");
        require(TwoXpBottles[msg.sender] >= neededXpBottles, "You need an xp bottle to do this.");
        targetSlime.level += 2;
    }

    function Pay1Xp(Slime memory slime) external payable {
        require(slime.level < 10, "Your slime is max level (try to split him ^^).");
        require(msg.value == LvlUpFee);
        slime.level += 1;
    }
}