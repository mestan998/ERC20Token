pragma solidity ^0.6.0;
import "./DappToken.sol";

contract DappTokenSale {
    address admin;
    DappToken public tokenContract;
    uint256 public tokenPrice;
    uint256 public tokensSold;

    event Sell (address _buyer, uint _amount);

    constructor (DappToken _tokenContract, uint256 _tokenPrice) public {
        admin = msg.sender;               // Assign an Admin
        tokenContract = _tokenContract;   // Token Contract
        tokenPrice = _tokenPrice;         // Token Price
        
    }

    //multiply
    function multiply(uint x, uint y) internal pure returns (uint z) {
       require( y == 0 || (z = x * y)/ y == x); 
    }
    
    // Buying Token
    function buyTokens(uint256 _numberOfTokens) public payable {
        require(msg.value == multiply(_numberOfTokens, tokenPrice));            // Require that value is equal to tokens
        require(tokenContract.balanceOf(address(this)) >= _numberOfTokens);     //Require that there are enough tokens in Contract
        require(tokenContract.transfer(msg.sender, _numberOfTokens));           //require that a transfer is succesful
        tokensSold += _numberOfTokens;                                          // Keep track of number of token Sold
        emit Sell(msg.sender, _numberOfTokens);                                 // Trigger sell Event
    }

    // Ending Token Sale

    function endSale(address payable _admin) public {
        require(msg.sender == admin);                                                     // Require only admin
        require(tokenContract.transfer(admin, tokenContract.balanceOf(address(this))));   //Transfer remaining dapp token to admin
        //destroy contract
        admin = _admin;
        _admin.transfer(address(this).balance);
    }

}