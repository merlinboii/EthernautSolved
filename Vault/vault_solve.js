const Web3 = require("web3");
require('dotenv').config()
const vaultSolve = async() => {
    const ethNetwork = process.env.ETHER_RINKEBY_NETWORK;

    try {
        const web3 = new Web3(new Web3.providers.HttpProvider(ethNetwork));
        console.log("CONNECTION SUCCESSFULL");

        const instance = process.env.VAULT_INSTANCE_ADDRESS;
        const password = await web3.eth.getStorageAt(instance, 1);
        console.log("=============== PASSWORD ==============");

        console.log(password);
    } catch (e) {
        console.log("CONNECTION ERROR!", e);
    }
}

vaultSolve();