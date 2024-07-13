import { NextRequest, NextResponse } from "next/server";
import { Address, parseAbi } from "viem";

import { getAddressForSymbol } from "@/lib/addresses";
import { publicClient } from "@/lib/client";

export async function GET(
  request: NextRequest,
  { params }: { params: { symbol: string } }
) {
  const searchParams = request.nextUrl.searchParams;
  const account = searchParams.get("account") as Address;
  const symbols = params.symbol;
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
  return NextResponse.json({ balance: balance.toString(), symbol: symbols[0] });
}
