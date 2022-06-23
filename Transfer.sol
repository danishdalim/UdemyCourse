pragma solidity ^0.5.7;

contract DuitNow {

        address owner;
        uint fortune;

    constructor() payable public {
        owner = msg.sender;
        fortune = msg.value;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    address payable[] Account;

    mapping(address => uint) Balance;

    function recname() public {
        
    }

    function recaccount(address payable wallet, uint amount) public onlyOwner {
        Account.push(wallet);
        Balance[wallet] = amount;
    }

    function payout() private {
        for(uint i=0; i<Account.length; i++) {
            Account[i].transfer(Balance[Account[i]]);
        }
    }
}