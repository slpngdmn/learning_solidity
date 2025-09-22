// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract QuizContract {
    // 🔹 Question + 4 options
    string public question = "What is the capital of Bangladesh?";
    string[4] public options = ["Dhaka", "Chittagong", "Khulna", "Sylhet"];

    // 🔹 Correct answer index (0-based, মানে Dhaka=0, Chittagong=1 ...)
    uint public correctAnswer = 0;

    // 🔹 Mapping: কে কোন উত্তর দিয়েছে তা track করার জন্য
    mapping(address => uint) public answers;

    // 🔹 Mapping: কে আগে উত্তর দিয়েছে তা চেক করার জন্য
    mapping(address => bool) public hasAnswered;

    // 👉 উত্তর দেয়া
    function submitAnswer(uint _option) public {
        require(_option < 4, "Invalid option"); // option 0–3 হতে হবে
        require(!hasAnswered[msg.sender], "Already answered!"); // একবারের বেশি উত্তর দেয়া যাবে না

        answers[msg.sender] = _option;
        hasAnswered[msg.sender] = true;
    }

    // 👉 উত্তর সঠিক কিনা চেক করা
    function checkAnswer(address _player) public view returns(bool) {
        require(hasAnswered[_player], "Player has not answered yet");
        return answers[_player] == correctAnswer;
    }
}