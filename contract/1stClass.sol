// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MyFirstContract{
    string userName;
    function setName(string memory finalName) public {
        userName = finalName;
    }
    
    function get() public view returns(string memory){
        return userName;
    }
}

