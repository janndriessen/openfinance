import { NextRequest, NextResponse } from "next/server";
import { PriceServiceConnection } from "@pythnetwork/price-service-client";

import { getPriceIdForSymbols } from "@/lib/addresses";

export async function GET(
  request: NextRequest,
  { params }: { params: { symbols: string } }
) {
  const symbols = params.symbols;
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
  if (!currentPrices) {
    return NextResponse.json({
      price: 0,
      symbol: `${symbols[0]}/${symbols[1]}`,
    });
  }
  const priceUnchecked = currentPrices[0].getPriceUnchecked();
  const price =
    Number(priceUnchecked.price) / Math.pow(10, Math.abs(priceUnchecked.expo));
  return NextResponse.json({
    price,
    symbol: `${symbols[0]}/${symbols[1]}`,
  });
}
