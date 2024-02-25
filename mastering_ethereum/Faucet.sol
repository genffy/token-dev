// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract onwed {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
}

contract mortal is onwed {
    function destory() public onlyOwner {
        payable(owner).transfer(address(this).balance);
    }
}

// Our first contract is a faucet!
contract Faucet is mortal {
    // Give out ether to anyone who asks
    function withdraw(uint256 withdraw_amount) public {
        // Limit withdrawal amount
        require(withdraw_amount <= 100000000000000000);
        address payable sender_payable = payable(msg.sender);
        // Send the amount to the address that requested it
        sender_payable.transfer(withdraw_amount);
        emit Withdraw(msg.sender, withdraw_amount);
    }

    event Withdraw(address indexed to, uint256 amount);
    event Deposit(address indexed from, uint256 amount);

    receive() external payable {
        // Accept any incoming amount
        emit Deposit(msg.sender, msg.value);
    }
}
