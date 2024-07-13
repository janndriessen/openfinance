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
