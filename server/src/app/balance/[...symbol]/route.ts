import { NextRequest, NextResponse } from "next/server";

import { publicClient } from "@/lib/client";
import { Address, parseAbi } from "viem";

function getAddressForSymbol(symbol: string): Address {
  switch (symbol.toLowerCase()) {
    default:
      // USDC
      return "0x036CbD53842c5426634e7929541eC2318f3dCF7e";
  }
}

export async function GET(
  request: NextRequest,
  { params }: { params: { symbol: string } }
) {
  const searchParams = request.nextUrl.searchParams;
  const account = searchParams.get("account") as Address;
  const symbols = params.symbol;
  console.log(symbols);
  if (symbols.length !== 1) {
    return NextResponse.json({ message: "wrong symbol", status: 404 });
  }
  const address = getAddressForSymbol(symbols[0]);
  const balance = await publicClient.readContract({
    address,
    abi: parseAbi([
      "function balanceOf(address owner) public view returns (uint256 balance)",
    ]),
    functionName: "balanceOf",
    args: [account],
  });
  console.log(balance.toString());
  return NextResponse.json({ balance: balance.toString(), symbol: symbols[0] });
}
