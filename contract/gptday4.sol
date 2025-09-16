// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Day4Contract {
    // =========================
    // 🔹 Array Example
    // =========================
    
    // একটি dynamic array (size সীমাহীন, বাড়ানো/কমানো যায়)
    uint[] public numbers;

    // একটি fixed array (size নির্দিষ্ট)
    // uint[3] public fixedNumbers = [1, 2, 3];

    // 👉 array-তে element যোগ করা
    function addNumber(uint _num) public {
        numbers.push(_num); // নতুন সংখ্যা যোগ হলো
    }

    // 👉 array-র নির্দিষ্ট index থেকে সংখ্যা বের করা
    function getNumber(uint _index) public view returns(uint) {
        return numbers[_index];
    }

    // 👉 array-র দৈর্ঘ্য (length)
    function getLength() public view returns(uint) {
        return numbers.length;
    }

    // =========================
    // 🔹 Mapping Example
    // =========================
    
    // mapping: key => value system (dictionary এর মত)
    mapping(address => uint) public balances;

    // 👉 balance set করা
    function setBalance(uint _amount) public {
        balances[msg.sender] = _amount;  
        // msg.sender = যে address function call করছে তার address
    }

    // 👉 balance read করা
    function getBalance(address _addr) public view returns(uint) {
        return balances[_addr];
    }
}
