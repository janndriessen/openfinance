import { NextRequest, NextResponse } from "next/server";

import { publicClient } from "@/lib/client";
import { Address, parseAbi } from "viem";

function getAddressForSymbol(symbol: string): Address {
  switch (symbol.toLowerCase()) {
    case "eurc":
      return "0x808456652fdb597867f38412077A9182bf77359F";
    case "samzn":
      return "0xEb7804E82306a9d91F027b21399c53ca7d621fe7";
    case "saapl":
      return "0x12F9210CdF76d7F3886C379dD5B93838848fC256";
    case "snke":
      return "0xCd71cFbFc9dA2F580169B1D6395A271632bb8950";
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
