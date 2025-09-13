// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract mappingDemo{
    // mapping (address => uint256) public Balances;
    // mapping (address => string) public Usernames;
    // mapping (string => bool) public isValid;

    // function setBalance (address user, uint256 amount) public {
    //     Balances[user] = amount;
    // }

    // function setUsername (address user, string calldata Username) public {
    //     Usernames[user] = Username;
    // }

    // mapping(address => mapping(address => uint256)) public checkBalance;
    // mapping(address => mapping(uint256 => mapping(uint256 => uint256))) public checkScore;

    // function setValue(address son, uint256 amount) public {
    //     checkBalance[msg.sender][son] = amount;
    // }

    // function setScore(uint256 gameID, uint256 level, uint256 score) public {
    //     checkScore[msg.sender][gameID][level] = score;
    // }

    mapping (address => uint256) public data;
    mapping (address => bool) public exists;

    function addData(uint256 value) public {
        require(!exists[msg.sender], "Already Exists");

        data[msg.sender] = value;
        exists[msg.sender] = true;
    }


}