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
forge script --chain base-sepolia scripts/SyntheticAssetsDeployment.s.sol:SyntheticAssetsDeployment --rpc-url $ALCHEMY_RPC --broadcast -vvvv
```

### Synthetic Assets

sAMZN: [0xeb7804e82306a9d91f027b21399c53ca7d621fe7](https://sepolia.basescan.org/token/0xeb7804e82306a9d91f027b21399c53ca7d621fe7)
sAAPL: [0x12f9210cdf76d7f3886c379dd5b93838848fc256](https://sepolia.basescan.org/token/0x12f9210cdf76d7f3886c379dd5b93838848fc256)
sNKE: [0xcd71cfbfc9da2f580169b1d6395a271632bb8950](https://sepolia.basescan.org/token/0xcd71cfbfc9da2f580169b1d6395a271632bb8950)
