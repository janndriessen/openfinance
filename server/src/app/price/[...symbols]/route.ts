import { NextRequest, NextResponse } from "next/server";
import { PriceServiceConnection } from "@pythnetwork/price-service-client";

import { Address } from "viem";

function getPriceIdForSymbols(symbol1: string, symbol2: string): Address {
  const symbol = `${symbol1.toLowerCase()}-${symbol2.toLowerCase()}`;
  switch (symbol) {
    case "samzn-usdc":
      return "0xb5d0e0fa58a1f8b81498ae670ce93c872d14434b72c364885d4fa1b257cbb07a";
    case "saapl-usdc":
      return "0x49f6b65cb1de6b10eaf75e7c03ca029c306d0357e91b5311b175084a5ad55688";
    case "snke-usdc":
      return "0x67649450b4ca4bfff97cbaf96d2fd9e40f6db148cb65999140154415e4378e14";
    default:
      // USDC
      return "0x036CbD53842c5426634e7929541eC2318f3dCF7e";
  }
}

export async function GET(
  request: NextRequest,
  { params }: { params: { symbols: string } }
) {
  const symbols = params.symbols;
  console.log(symbols);
  if (symbols.length !== 2) {
    return NextResponse.json({ message: "not found", status: 404 });
  }
  //   const address = getAddressForSymbol(symbols[0]);
  const connection = new PriceServiceConnection("https://hermes.pyth.network", {
    priceFeedRequestConfig: {
      // Provide this option to retrieve binary price updates for on-chain contracts.
      // Ignore this option for off-chain use.
      binary: false,
    },
  });
  const priceIds = [
    // You can find the IDs of prices at https://pyth.network/developers/price-feed-ids
    getPriceIdForSymbols(symbols[0], symbols[1]),
  ];
  // Get the latest price updates for the given price IDs.
  // If you set `binary: true` above, then this method also returns signed price updates for the on-chain Pyth contract.
  const currentPrices = await connection.getLatestPriceFeeds(priceIds);
  console.log(currentPrices);
  if (!currentPrices) {
    return NextResponse.json({
      price: 0,
      symbol: `${symbols[0]}/${symbols[1]}`,
    });
  }
  console.log(currentPrices);
  const priceUnchecked = currentPrices[0].getPriceUnchecked();
  const price =
    Number(priceUnchecked.price) / Math.pow(10, Math.abs(priceUnchecked.expo));
  console.log(
    price,
    priceUnchecked.price,
    Math.pow(10, Math.abs(priceUnchecked.expo))
  );
  return NextResponse.json({
    price,
    symbol: `${symbols[0]}/${symbols[1]}`,
  });
}
