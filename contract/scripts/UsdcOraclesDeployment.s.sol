// SPDX-License-Identifier: Apache 2
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "openzeppelin-contracts/contracts/mocks/ERC20Mock.sol";
import "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

import {OracleSwap} from "../src/OracleSwap.sol";

contract UsdcOraclesDeployment is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address deployerAddress = vm.addr(deployerPrivateKey);
        vm.startBroadcast(deployerPrivateKey);

        IERC20 usdc = IERC20(0x036CbD53842c5426634e7929541eC2318f3dCF7e);
        IERC20 sAMZN = IERC20(0xEb7804E82306a9d91F027b21399c53ca7d621fe7);
        IERC20 sAAPL = IERC20(0x12F9210CdF76d7F3886C379dD5B93838848fC256);
        IERC20 sNKE = IERC20(0xCd71cFbFc9dA2F580169B1D6395A271632bb8950);

        address pythPriceFeedContract = 0xA2aa501b19aff244D90cc15a4Cf739D2725B5729;
        // USDC/USD
        bytes32 quotePriceId = bytes32(0xeaa020c61cc479712813461ce153894a96a6c00b21ed0cfc2798d1f9a9e9c94a);

        // Deploy OracleSwap contracts
        OracleSwap swapAmzn = new OracleSwap(
            pythPriceFeedContract,
            bytes32(0xb5d0e0fa58a1f8b81498ae670ce93c872d14434b72c364885d4fa1b257cbb07a), // BASE_PRICE_ID
            quotePriceId,
            address(usdc),
            address(sAMZN)
        );

        OracleSwap swapAapl = new OracleSwap(
            pythPriceFeedContract,
            bytes32(0x49f6b65cb1de6b10eaf75e7c03ca029c306d0357e91b5311b175084a5ad55688), // BASE_PRICE_ID
            quotePriceId,
            address(usdc),
            address(sAAPL)
        );

        OracleSwap swapNke = new OracleSwap(
            pythPriceFeedContract,
            bytes32(0x67649450b4ca4bfff97cbaf96d2fd9e40f6db148cb65999140154415e4378e14), // BASE_PRICE_ID
            quotePriceId,
            address(usdc),
            address(sNKE)
        );

        // // Transfer 300 tokens of each ERC20 token to the OracleSwap contracts
        usdc.transfer(address(swapAmzn), 300 * 10 ** 6);
        sAMZN.transfer(address(swapAmzn), 300 * 10 ** 18);

        usdc.transfer(address(swapAapl), 300 * 10 ** 6);
        sAAPL.transfer(address(swapAapl), 300 * 10 ** 18);

        usdc.transfer(address(swapNke), 300 * 10 ** 6);
        sNKE.transfer(address(swapNke), 300 * 10 ** 18);

        console2.log("OracleSwap contract USDC/sAMZN deployed at address: ", address(swapAmzn));
        console2.log("OracleSwap contract USDC/sAAPL deployed at address: ", address(swapAapl));
        console2.log("OracleSwap contract USDC/sNKE deployed at address: ", address(swapNke));

        vm.stopBroadcast();
    }
}
