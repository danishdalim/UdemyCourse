pragma solidity ^0.5.7;

contract Will {

    address owner;
    uint fortune;
    bool deceased;

    constructor() payable public {
        owner = msg.sender;
        fortune = msg.value;
        deceased = false;
    
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    address payable[] Wallets;

    mapping(address => uint) Inheritance;

    function setInheritance(address payable wallet, uint amount) public onlyOwner {
        familyWallets.push(wallet);
        Inheritance[wallet] = amount;
    }

    function payout() private mustbedeceased {
        for(uint i=0; i<Wallets.length; i++) {
            Wallets[i].transfer(Inheritance[familyWallets[i]]);
        }
    }

}