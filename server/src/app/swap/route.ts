import {
  Address,
  encodeAbiParameters,
  encodeFunctionData,
  parseAbi,
} from "viem";
import { EvmPriceServiceConnection } from "@pythnetwork/pyth-evm-js";

import { getAddressForSymbol, getPriceIdForSymbols } from "@/lib/addresses";
import { publicClient, walletClient } from "@/lib/client";

function getOracleFor(symbol1: string, symbol2: string): Address {
  const symbol = `${symbol1.toLowerCase()}-${symbol2.toLowerCase()}`;
  switch (symbol) {
    case "samzn-usdc":
      return "0xD84243f2B34072f386048096441b2201635AfCf7";
    case "saapl-usdc":
      return "0x28fdd7f82f0358B75EF52bEaAF904C4aa970F769";
    case "snke-usdc":
      return "0x3aBcBB9F2A560457a094829d6257EAA04D9A8176";
    default:
      // USDC
      return "0x036CbD53842c5426634e7929541eC2318f3dCF7e";
  }
}

export const dynamic = "force-dynamic";
export async function POST(request: Request) {
  const res = await request.json();
  const ammOracle = getOracleFor(res.baseToken, res.quoteToken);
  console.log(ammOracle);
  const isBuy: boolean = res.isBuy;
  console.log("isBuy", isBuy);
  const inputToken = getAddressForSymbol(
    isBuy ? res.quoteToken : res.baseToken
  );
  const spender = ammOracle;
  // All tokens have been pre-approved for the user for convenience of the demo.
  // With actually implementing e.g. smart accounts with passkeys, batch transactions
  // could be used to do this in one step.
  //   const hash = await walletClient.writeContract({
  //     address: inputToken,
  //     abi: parseAbi([
  //       "function approve(address _spender, uint256 _value) public returns (bool success)",
  //     ]),
  //     functionName: "approve",
  //     args: [spender, BigInt(res.amount)],
  //   });
  // USDC/USD
  const quoteTokenPriceFeedId =
    "0xeaa020c61cc479712813461ce153894a96a6c00b21ed0cfc2798d1f9a9e9c94a";
  const baseTokenPriceFeedId = getPriceIdForSymbols(
    res.baseToken,
    res.quoteToken
  );
  const pythPriceService = new EvmPriceServiceConnection(
    "https://hermes.pyth.network"
  );
  const priceFeedUpdateData = (await pythPriceService.getPriceFeedsUpdateData([
    baseTokenPriceFeedId,
    quoteTokenPriceFeedId,
  ])) as `0x${string}`[];
  console.log(isBuy, res.amount, priceFeedUpdateData);
  const pythPriceFeedContract = "0xA2aa501b19aff244D90cc15a4Cf739D2725B5729";
  const updateFee: bigint = await publicClient.readContract({
    address: pythPriceFeedContract,
    abi: parseAbi([
      "function getUpdateFee(bytes[] calldata pythUpdateData) public returns (uint256)",
    ]),
    functionName: "getUpdateFee",
    args: [priceFeedUpdateData],
  });
  console.log(updateFee.toString(), walletClient.account.address);
  const data = encodeFunctionData({
    abi: parseAbi([
      "function swap(bool isBuy, uint256 size, bytes[] calldata pythUpdateData) external payable",
    ]),
    functionName: "swap",
    args: [isBuy, BigInt(res.amount), priceFeedUpdateData],
  });
  const txRequest = await walletClient.prepareTransactionRequest({
    from: walletClient.account.address,
    to: ammOracle,
    data,
    value: updateFee,
  });
  const serializedTransaction = await walletClient.signTransaction(txRequest);
  const hash = await walletClient.sendRawTransaction({ serializedTransaction });
  console.log(hash);
  return Response.json({ res });
}
