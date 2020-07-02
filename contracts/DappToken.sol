pragma solidity ^0.6.0;

contract DappToken {
    uint256 public totalSupply;
    string public name = "Dapp Token";
    string public symbol = "DAPP";
    string public standard = "DApp Token v1.0";

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value

    );

    //Approve

    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value

    );
    
    mapping (address => uint256) public balanceOf;
    mapping(address=> mapping(address => uint256)) public allowance;

    // allowance

    constructor (uint256 _initialSupply) public {    // allocate the initial supply
        balanceOf[msg.sender] = _initialSupply;
        totalSupply = _initialSupply;   

    }
    //Transfer function
    
    function transfer(address _to, uint256 _value) public returns (bool success){
    
        require(balanceOf[msg.sender] >= _value);    //Exception if account doesn't have enough

        balanceOf[msg.sender] -= _value;    //Transfer the balance
        balanceOf[_to] += _value;

        emit Transfer(msg.sender, _to, _value);  //Transfer Event

        return true;    //return a boolean
    }

    // Approve function
    function approve(address _spender, uint256 _value) public returns (bool success) {
        // Allowance 
        allowance[msg.sender][_spender] = _value;

        // Approve event
        emit Approval(msg.sender, _spender, _value);

        return true;
    }
    //transfer from

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= balanceOf[_from]);
        require(_value <= allowance[_from][msg.sender]);
        
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        //update the allowance
        allowance[_from][msg.sender] -= _value;

        emit Transfer(_from, _to, _value);
        
        return true;
    }

}