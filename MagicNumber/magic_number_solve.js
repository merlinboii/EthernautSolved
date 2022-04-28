require('dotenv').config({path:__dirname+'/./../.env'})
const ethers = require('ethers');
var Web3 = require("web3");
var web3 = new Web3(
  Web3.givenProvider ||
    process.env.PROVIDER_URL // url of rinkeby wss provider
);

/**
 * @desc We can deploy contract using raw bytescode
 * @solution You have to understand about EVM OPCODE and EVM Contract Craetion
 * 1. Create Runtime Code
 * assembly {
     MSTORE(0x80, 0x2A) // MSTORE(position, value)
     RETURN(0x80, 0x20) // RETURN(valueSize(length), position)
   }
   TURN INTO OPCODE ->  PUSH 0x2A, PUSH 0x08, MSTORE, PUSH 0x20, PUSH 0x80, RETURN
   TURN INTO BYTE -> 602A 6080 52 6020 6080 F3
 * 2. Create Creation code
 * assembly {
    // CODECOPY(destination, current position of runtime(offset), size / length of runtime code)
    CODECOPY(0x00,0x0C,0x0A) // 0x00 -> destination, 0x0C -> size of creation code opcode, OxOA -> size / length of runtime op code
    RETURN(0x00,0x0A)
   }
   TURN INTO OPCODE ->  PUSH 0x0A, PUSH 0x0C, PUSH 0x00 CODECOPY, PUSH 0x0A, PUSH 0, RETURN
   TURN INTO BYTE -> 600A 600C 6000 39 600A 6000 F3
 *
 * BYTECODE : 0x600A600C600039600A6000F3602A60805260206080F3
 * 
 * Might be useful Link
 * https://blog.openzeppelin.com/deconstructing-a-solidity-contract-part-ii-creation-vs-runtime-6b9d60ecb44c/
 * https://www.ethervm.io/
 * https://github.com/crytic/evm-opcodes
 */

const attack = async () => {
  const player = process.env.ADDRESS;
  const bytescode = "0x600A600C600039600A6000F3602A60805260206080F3";

  let mnemonic = process.env.MNEMONIC;
  let mnemonicWallet = ethers.Wallet.fromMnemonic(mnemonic);

  web3.eth.accounts.wallet.add(mnemonicWallet.privateKey)

  web3.eth.sendTransaction({ from: player, data: bytescode}, 
   (err,res) => {
       if (!err) {
        console.log(res)
       }else {
        console.log(err)
       }
   })
  
};

attack();