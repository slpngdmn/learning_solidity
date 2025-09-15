// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MyFirstContract{
    // string userName;
    // function setName(string memory finalName) public {
    //     userName = finalName;
    // }
    
    // function get() public view returns(string memory){
    //     return userName;
    // }

//     string public name = "Emon";   // একটি variable

//     function setName(string memory newname) public {
//         name = newname;   // নতুন নাম সেট করবে
//     }

//     function getName() public view returns(string memory) {
//     return name; //shudhu dekhar jonno view
// }

//     function calculate() public pure returns(uint) {
//     uint x = 10;  //pure modify kore na abr read o kore na, just calculate kore.
//     uint y = 20; //returns 
//     return x + y;
// }

string public name;
    uint public age;
    uint public newAge; // Storage variable

    function setName(string memory _name) public {
        name = _name;
    }

    function setAge(uint _age) public {
        age = _age;
    }

    // Removed `view` because we're modifying `newAge`
    function addAge(uint _addAge) public returns(uint) {
        newAge = age + _addAge;
        return newAge;
    }

    function getInfo() public view returns(string memory, uint, uint) {
        return (name, age, newAge);
    }

}

