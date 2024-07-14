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

forge script --chain base-sepolia scripts/EurcOraclesDeployment.s.sol:EurcOraclesDeployment --rpc-url $ALCHEMY_RPC --broadcast -vvvv
```

### Oracles

- sAMZN/USDC: [0xd84243f2b34072f386048096441b2201635afcf7](https://sepolia.basescan.org/address/0xd84243f2b34072f386048096441b2201635afcf7)
- sAAPL/USDC: [0x28fdd7f82f0358b75ef52beaaf904c4aa970f769](https://sepolia.basescan.org/address/0x28fdd7f82f0358b75ef52beaaf904c4aa970f769)
- sNKE/USDC: [0x3aBcBB9F2A560457a094829d6257EAA04D9A8176](https://sepolia.basescan.org/address/0x3aBcBB9F2A560457a094829d6257EAA04D9A8176)

- sAMZN/EURC: [0xae59973e8d3f2fcaf1dc79c7abf64cb0931e2eb3](https://sepolia.basescan.org/address/0xae59973e8d3f2fcaf1dc79c7abf64cb0931e2eb3)
- sAAPL/EURC: [0xd7d4becc6edce91d0ee0815f0d553fe60f724f29](https://sepolia.basescan.org/address/0xd7d4becc6edce91d0ee0815f0d553fe60f724f29)
- sNKE/EURC: [0x004c860387ed009173b0a5645abf2e0ee02fc994](https://sepolia.basescan.org/address/0x004c860387ed009173b0a5645abf2e0ee02fc994)

### Synthetic Assets

- sAMZN: [0xeb7804e82306a9d91f027b21399c53ca7d621fe7](https://sepolia.basescan.org/token/0xeb7804e82306a9d91f027b21399c53ca7d621fe7)
- sAAPL: [0x12f9210cdf76d7f3886c379dd5b93838848fc256](https://sepolia.basescan.org/token/0x12f9210cdf76d7f3886c379dd5b93838848fc256)
- sNKE: [0xcd71cfbfc9da2f580169b1d6395a271632bb8950](https://sepolia.basescan.org/token/0xcd71cfbfc9da2f580169b1d6395a271632bb8950)

## Screenshots
<img src="https://github.com/user-attachments/assets/802c5a3a-2597-4965-9ddc-cc1fa4b362b8" width="30%"/>
<img src="https://github.com/user-attachments/assets/f2a18e2b-0c66-4f8f-bcfa-e91a9de8cea5" width="30%"/>
<img src="https://github.com/user-attachments/assets/7f9b823f-b3bf-431c-889e-47a0236a703a" width="30%"/>

