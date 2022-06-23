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

    modifier mustbedeceased {
        require(deceased == true);
        _;
    }

    address payable[] familyWallets;

    mapping(address => uint) Inheritance;

    function setInheritance(address payable wallet, uint amount) public onlyOwner {
        familyWallets.push(wallet);
        Inheritance[wallet] = amount;
    }

    function payout() private mustbedeceased {
        for(uint i=0; i<familyWallets.length; i++) {
            familyWallets[i].transfer(Inheritance[familyWallets[i]]);
        }
    }

    function hasdeceased() public onlyOwner {
        deceased = true;
        payout();
    }
}