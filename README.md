# Open Finance

Submission for ETHGlobal Brussels 2024

## Setup

To setup the contracts `cd contract` and follow instructions from [here](https://github.com/pyth-network/pyth-examples/tree/main/price_feeds/evm/oracle_swap#building).

```
cd contract
cp .env.default .env
```

## Deployments

```
cd contract
source .env

// synthetic assets
forge script --chain base-sepolia scripts/SyntheticAssetsDeployment.s.sol:SyntheticAssetsDeployment --rpc-url $ALCHEMY_RPC --broadcast -vvvv

// swap oracles
forge script --chain base-sepolia scripts/UsdcOraclesDeployment.s.sol:UsdcOraclesDeployment --rpc-url $ALCHEMY_RPC --broadcast -vvvv
```

### Oracles

- sAMZN/USDC: [0xd84243f2b34072f386048096441b2201635afcf7](https://sepolia.basescan.org/address/0xd84243f2b34072f386048096441b2201635afcf7)
- sAAPL/USDC: [0x28fdd7f82f0358b75ef52beaaf904c4aa970f769](https://sepolia.basescan.org/address/0x28fdd7f82f0358b75ef52beaaf904c4aa970f769)
- sNKE/USDC: [0x3aBcBB9F2A560457a094829d6257EAA04D9A8176](https://sepolia.basescan.org/address/0x3aBcBB9F2A560457a094829d6257EAA04D9A8176)

### Synthetic Assets

- sAMZN: [0xeb7804e82306a9d91f027b21399c53ca7d621fe7](https://sepolia.basescan.org/token/0xeb7804e82306a9d91f027b21399c53ca7d621fe7)
- sAAPL: [0x12f9210cdf76d7f3886c379dd5b93838848fc256](https://sepolia.basescan.org/token/0x12f9210cdf76d7f3886c379dd5b93838848fc256)
- sNKE: [0xcd71cfbfc9da2f580169b1d6395a271632bb8950](https://sepolia.basescan.org/token/0xcd71cfbfc9da2f580169b1d6395a271632bb8950)
