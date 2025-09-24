// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract BankAccount{
    mapping(address => uint256) private balances;
    address[] internal accountHolders;
    uint256 public totalDeposits;
    address public owner;
    string public contractName;
    uint256 public totalSupply;
   

    constructor(string memory _name, uint256 _totalSupply) {
        owner = msg.sender; // Sets the deployer as the owner
        contractName = _name; // Initializes the contract name
        totalSupply = _totalSupply;
    }

    event Deposit(address indexed account, uint256 indexed amount); //3 indexed 
    event Withdrawl(address account, uint256 amount);

    function deposit() external payable {
        require(msg.value > 0, 'Must deposit something');

        if(balances[msg.sender] == 0){
            accountHolders.push(msg.sender);
        }

        balances[msg.sender] += msg.value;
        totalDeposits += msg.value;

        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");

        balances[msg.sender] -= amount;
        totalDeposits -= amount;

        payable(msg.sender).transfer(amount);

        emit Withdrawl(msg.sender, amount);
    }

    function getBalance(address account) public view returns(uint256){
        return balances[account];
    }
}

// contract PremiumBankAccount is BankAccount {
//     uint256 internal minimumBalance = 1000 wei;

//     function getPremiumStatus(address account) public view returns(bool){
//         return getBalance(account) >= minimumBalance;
//     }
// }