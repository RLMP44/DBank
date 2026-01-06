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

async function checkBalance() {
  try {
    const currentAmount = await dbank.checkBalance();
    const roundAmount = currentAmount.toFixed(2)
    document.getElementById("value").innerText = roundAmount.toString();
  } catch (err) {
    console.error("Error fetching balance:", err);
  }
}

window.addEventListener("load", async function() {
  checkBalance()
})

document.querySelector("form").addEventListener("submit", async function(event) {
  event.preventDefault();

  const button = event.target.querySelector("#submit-btn");

  const inputAmount = parseFloat(document.getElementById("input-amount").value);
  const withdrawAmount = parseFloat(document.getElementById("withdraw-amount").value);

  button.setAttribute("disabled", true);

  if (document.getElementById("input-amount").value.length != 0) {
    await dbank.topUp(inputAmount);
    document.getElementById("input-amount").value = "";
  }

  if (document.getElementById("withdraw-amount").value.length != 0) {
    await dbank.withdraw(withdrawAmount);
    document.getElementById("withdraw-amount").value = "";
  }

  await checkBalance();
  button.removeAttribute("disabled");

})
