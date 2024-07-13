// SPDX-License-Identifier: Apache 2
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "openzeppelin-contracts/contracts/mocks/ERC20Mock.sol";

contract SyntheticAssetsDeployment is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address deployerAddress = vm.addr(deployerPrivateKey);
        vm.startBroadcast(deployerPrivateKey);

        // Deploy ERC-20 tokens with 10000 tokens each to the deployer address
        ERC20Mock sAMZN = new ERC20Mock("sAMZN", "sAMZN", deployerAddress, 10000 * 10 ** 18);
        ERC20Mock sAAPL = new ERC20Mock("sAAPL", "sAAPL", deployerAddress, 10000 * 10 ** 18);
        ERC20Mock sNKE = new ERC20Mock("sNKE", "sNKE", deployerAddress, 10000 * 10 ** 18);

        console2.log("sAMZN Token deployed at address: ", address(sAMZN));
        console2.log("sAAPL Token deployed at address: ", address(sAAPL));
        console2.log("sNKE Token deployed at address: ", address(sNKE));

        vm.stopBroadcast();
    }
}
