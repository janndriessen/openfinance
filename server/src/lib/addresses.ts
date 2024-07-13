import { Address } from "viem";

export function getAddressForSymbol(symbol: string): Address {
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

export function getPriceIdForSymbols(
  symbol1: string,
  symbol2: string
): Address {
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
