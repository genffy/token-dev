        // Our first contract is a faucet!
        contract Faucet {
        3
     // Give out ether to anyone who asks
             function withdraw(uint withdraw_amount) public {
        6
 // Limit withdrawal amount
         require(withdraw_amount <= 100000000000000000);
        9
 // Send the amount to the address that requested it
         msg.sender.transfer(withdraw_amount);
              }
        
              // Accept any incoming amount
              function () public payable {}
        
         }