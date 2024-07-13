import { createPublicClient, http } from "viem";
import { baseSepolia } from "viem/chains";

export const publicClient = createPublicClient({
  chain: baseSepolia,
  transport: http(process.env.ALCHEMY_RPC),
});
