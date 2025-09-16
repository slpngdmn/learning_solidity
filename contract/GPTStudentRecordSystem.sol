// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentRecordSystem{

    struct Student {
        string name;
        uint age;
        address wallet;
    }

    mapping(uint => Student) public Students;

    uint[] public Roll;

    function addStudent(uint _roll, string memory _name, uint _age ) public {
        Students[_roll] = Student(_name, _age, msg.sender);
        Roll.push(_roll);
    }

    function updateName(uint _roll, string memory newname) public {
        Student storage s =  Students[_roll];
        s.name = newname;
    }

    function getStudentInfo(uint _roll) public view returns(string memory, uint, address) {
        Student memory s = Students[_roll];
        return (s.name, s.age, s.wallet);
    }

    function TotalStudent() public view returns(uint) {
        return Roll.length;
    }
}