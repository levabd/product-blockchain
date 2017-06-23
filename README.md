# Product blockchain example project

## Based on the article 
https://medium.com/zeppelin-blog/the-hitchhikers-guide-to-smart-contracts-in-ethereum-848f08001f05

## Load project 
```
git clone git@github.com:peshkov3/solidity-example.git && cd solidity-example
```
## Instell and run Truffle
```
sudo npm install -g ethereumjs-testrpc
testrpc
```
## Compile & migrate contracts
```
truffle compile
truffle migrate
```
 ## Open console
```
truffle console 
```
## Run contract methods
```
// get contract instance
truffle(development)> var poe = ProofOfProductExistence.deployed()

// create product with unique key - "Get the new version of the contract"
truffle(development)> poe.then(contract=>contract.create("Bacardi Superior Rum 0.5 л.", "description1", "Superior", "Get the new version of the contract").then(console.log))

// if blockchain has product - found
truffle(development)> poe.then(contract=>contract.hasProduct("Get the new version of the contract").then(console.log))
true

// if blockchain has product - not found
truffle(development)> poe.then(contract=>contract.hasProduct("Get the new version of the contract 2").then(console.log))
false

// show product 
truffle(development)> poe.then(contract=>contract.show("Get the new version of the contract").then(console.log))
[ 'Bacardi Superior Rum 0.5 л.',
  'description1',
  'Superior',
  'Get the new version of the contract' ]
  
// product does not exists 
truffle(development)> poe.then(contract=>contract.show("Get the new version of the contract 2").then(console.log))
Error: Error: VM Exception while executing eth_call: invalid opcode

```
<p>Ethereum docs: http://ethdocs.org/en/latest/contracts-and-transactions/index.html</p>
<p>Solidity docs: https://solidity.readthedocs.io/en/develop/</p>
<p>Client for blockchain can be written using: https://github.com/ethereum/web3.js</p>
<p>Example of clients: https://github.com/tomconte/solarchain-dashboard/blob/master/viz.js</p>
