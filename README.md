## Adding a test in Foundry


`forge test`
It will try to compile the smart contracts, run the test, and give you the results.


### Testing NFT Transfers with VM Pranking¶
So, how do you test the transfer from address 1 to address 2?

With VM Pranking.

VM Pranking is a special contract command that instructs the VM to use a different account as msg.sender for example. vm.prank(address) would send the next transaction with the address given. If you do vm.startPrank(address) you can send several instructions with a new address


Pranking is just setting the address to another account - how do you get balance? In testing you can use the same cheatcode prank, while in anvil you'd use another VM cheatcode, called hoax(address), there you get some ether too.

## Deploying a Smart Contract with Foundry

Add a script to the script folder, called "Deploy.sol":

```
pragma solidity ^0.8.4;

import "forge-std/Script.sol";
import "../src/Spacebear.sol";

contract SpacebearScript is Script {
    function setUp() public {}

    function run() public {
        string memory seedPhrase = vm.readFile(".secret");
        uint256 privateKey = vm.deriveKey(seedPhrase, 0);
        vm.startBroadcast(privateKey);
        Spacebear spacebear = new Spacebear();

        vm.stopBroadcast();
    }
}
```
A new .env file:

```
GOERLI_RPC_URL=https://goerli.infura.io/v3/[INFURA_KEY]
ETHERSCAN_API_KEY=...
```
Enter there the infura key we created earlier and the etherscan api key, if you want foundry to directly verify the contracts with etherscan.

One last thing is missing to actually let foundry read the contents of the .secret file, we have to give it permissions. Change the content of the foundry.toml file and add fs_permissions:

```
[profile.default]
src = 'src'
out = 'out'
libs = ['lib']
fs_permissions = [{ access = "read", path = "./"}]
# See more config options https://github.com/foundry-rs/foundry/tree/master/config

[rpc_endpoints]
goerli = "${GOERLI_RPC_URL}"
```
## Running a Foundry Script
It's time to run the script. Before we can do that, we have to make sure the environment variables are set in our environment.

Run `source .env`
inside the foundry folder to set the environment variables correctly.

Then you can run the forge script command to run the deploy script:


`forge script script/Deploy.sol:SpacebearScript --broadcast --verify --rpc-url ${GOERLI_RPC_URL}`

What should happen is that forge runs your solidity script. In that script it tries to broadcast the transaction. It writes it back into the broadcast folder in a run-latest.json file.

