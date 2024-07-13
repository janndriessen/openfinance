import { NextResponse } from "next/server";
import { Address, parseAbi } from "viem";

import { getAddressForSymbol } from "@/lib/addresses";
import { publicClient } from "@/lib/client";

export const dynamic = "force-dynamic";
export async function GET(
  request: Request,
  { params }: { params: { symbol: string } }
) {
  const { searchParams } = new URL(request.url);
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
