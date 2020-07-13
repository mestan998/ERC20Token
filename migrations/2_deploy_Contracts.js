var DappToken = artifacts.require("./DappToken.sol");
var DappTokenSale = artifacts.require("./DappTokenSale.sol");

module.exports = async function(deployer) {
  await deployer.deploy(DappToken, 1000000).then(function(){
    // Token Price is 0.001 ether
    var tokenPrice = 1000000000000000;
    return deployer.deploy(DappTokenSale, DappToken.address, tokenPrice);
  });
  
};