// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract variableDemo {
    uint256 public totalSupply;
    address private owner;
    mapping ( address => uint ) internal balances;

    constructor(){
    owner = msg.sender;
    totalSupply = 1000000;
}

    function fun(uint256 input) public pure returns(uint256){
        uint256 multiplier = 5;
        uint256 result = input * multiplier;
        uint256 bonus = 100;

        if(result > 1000){
            uint256 extraBonus = 50;
            bonus += extraBonus;
        }

        return result + bonus;
    }

}

contract arrayDemo{
    uint256[5] public fixedArray;
    address[3] public topHolders;

    constructor(){
        fixedArray = [1, 2, 3, 4, 5];
    }

    function updatetopHolders(uint256 index, address holder) public{
        require(index < 3, "index out of Bounds");
        topHolders[index] = holder;
    }
}


contract dynamicArray{
    uint256[] public scores;
    address[] public participants;
    string[] public names;

    function addScore(uint256 score) public {
        scores.push(score);
    }
}



// contract dynamicArray{

//     uint256[] public scores;
//     address[] public participants;
//     string[] public names;

//     function arrayOperations() public {
//         uint256[] memory tempArray = new uint256[](3);
//         uint256 firstScore = scores[0];
//         uint256 arrayLength = scores.length;

//         scores.push(100);
//         scores[0] = 50;
//         scores.pop();
//     }
// }