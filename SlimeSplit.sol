// SPDX-License-Identifier: MIT


pragma solidity ^0.8.13;
import "./SlimeGame.sol";
import "./SlimeXp.sol";
import "./SlimeDungeon.sol";

contract SlimeSplit is SlimeDungeon {

    function splitting(Slime memory slime, string memory new_name) public {
        require(slime.level == 10);
        slime.level = 2;
        SlimesList.push(Slime(new_name, slime.level, uint32(block.timestamp + cooldownValue)));
        ownerOfSlime[new_name] = msg.sender;
        slimeCount[msg.sender] += 1;
    }
}