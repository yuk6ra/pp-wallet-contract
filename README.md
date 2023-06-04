![Frame 42 (4)](https://github.com/yuk6ra/twilight-wallet-contract/assets/59524938/c85d6692-7a0f-40c0-80ae-13945052b2ef)

# PP Wallet 

## Deploy & Verify

```
$ npx hardhat run scripts/deploy-pp-account-factory.js --network mumbai

$ npx hardhat verify <CA>  --network mumbai --constructor-args args/simple-acount-factory.js
```

## Contract Address


# Account Abstraction

https://github.com/eth-infinitism/account-abstraction

Implementation of contracts for [ERC-4337](https://eips.ethereum.org/EIPS/eip-4337) account abstraction via alternative mempool.

## Resources

[Vitalik's post on account abstraction without Ethereum protocol changes](https://medium.com/infinitism/erc-4337-account-abstraction-without-ethereum-protocol-changes-d75c9d94dc4a)

[Discord server](http://discord.gg/fbDyENb6Y9)

[Bundler reference implementation](https://github.com/eth-infinitism/bundler)

[Bundler specification test suite](https://github.com/eth-infinitism/bundler-spec-tests)