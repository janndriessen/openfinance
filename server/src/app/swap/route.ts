import { Address } from "viem";

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

export async function POST(request: Request) {
  const res = await request.json();
  const ammOracle = getOracleFor(res.baseToken, res.quoteToken);
  console.log(ammOracle);
  const isBuy = res.isBuy;
  console.log("isBuy", isBuy);
  return Response.json({ res });
}
