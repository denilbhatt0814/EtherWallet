pragma solidity >=0.7.0 <0.9.0;

contract EtherWallet {
    address payable public owner;

    // a constructor runs only once upon 
    // deploying the contract
    constructor(){    
        // sets owner to one who deploys
        owner = payable(msg.sender); 
    }
    
    // check balance of contract
    function getBalance() external view returns(uint){
        return address(this).balance;
    }

    // anyone can deposit to owners wallet
    function deposit() external payable {}

    // withdraw a specific amt to owner's account
    function withdraw(uint _amt) external {
        require(msg.sender == owner, "only owner can withdraw");
        owner.transfer(_amt);
    }

    // pay to someone from your EtherWallet's balance
    function pay(address payable _addr, uint _amt) external {
        require(msg.sender == owner, "only owner can pay");
        _addr.transfer(_amt);
    }   
}
