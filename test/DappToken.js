var DappToken = artifacts.require("./DappToken.sol");

contract ('DappToken', function(accounts){
    it ('set the total supply upon deployment', function(){
        return DappToken.deployed().then(function(instance){
            tokenInstance = instance;
            return tokenInstance.totalSupply();
        }).then(function(totalSupply){
            assert.equal(totalSupply.toNumber(), 1000000, 'set the total number to 1,000,000');
        });

    });
})