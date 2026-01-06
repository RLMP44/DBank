import { canisterId, idlFactory } from "../../declarations/dbank";
import { Actor, HttpAgent } from "@dfinity/agent";

const agent = new HttpAgent({ host: "http://localhost:8080" });

if (process.env.NODE_ENV !== "production") {
  agent.fetchRootKey();
}

export const dbank = Actor.createActor(idlFactory, {
  agent,
  canisterId,
});

window.addEventListener("load", async function() {
  console.log("dbank canisterId:", canisterId);

  try {
    const currentAmount = await dbank.checkBalance();
    console.log(currentAmount);
    document.getElementById("value").innerText = currentAmount.toString();
  } catch (err) {
    console.error("Error fetching balance:", err);
  }
})
