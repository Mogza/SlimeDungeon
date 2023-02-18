// SPDX-License-Identifier: MIT


pragma solidity ^0.8.13;
import "./SlimeGame.sol";
import "./SlimeXp.sol";

contract SlimeDungeon is SlimeXp {
    uint Rand = 0;

    function isHeal(Slime memory _slime) internal view returns(bool) {
        return(_slime.cooldown <= block.timestamp);
    }

    function resetCooldown(Slime memory _slime) internal view {
        _slime.cooldown = uint32(block.timestamp + cooldownValue);
    }

    function RandomNum() internal returns(uint) {
        Rand += 1;
        return (uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, Rand))) % 100);
    }

    function exploreLvl1(Slime memory slime) public {
        require(isHeal(slime), "Your slime is hurt and need to recover.");
        if (RandomNum() <= slime.level * 10) {
            OneXpBottles[msg.sender] += 1;
        }
        resetCooldown(slime);
    }

    function exploreLvl2(Slime memory slime) public {
        require(slime.level >= 5, "Your slime is too young to be in here.");
        require(isHeal(slime), "Your slime is hurt and need to recover.");
        if (RandomNum() <= slime.level * 5) {
            TwoXpBottles[msg.sender] += 1;
        }
        resetCooldown(slime);
    }
}