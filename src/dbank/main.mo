import Debug "mo:base/Debug";

actor DBank {
  // 'stable' turns the variable from flexible to persisted
  // persists through re-deploys
  stable var currentValue: Nat = 300;
  // currentValue := 100;
  let id = 1035;

  public func topUp(amount: Nat) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Nat) {
    if (amount <= currentValue) {
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } else {
      Debug.print("insufficient funds");
      Debug.print(debug_show(currentValue));
    }
  };

  // must add "query" for query calls
  // when returning something, must include "async" and returning type
  public query func checkBalance(): async Nat {
    return currentValue;
  };
}

// Motoko style guide: https://legacy.internetcomputer.org/docs/motoko/style#style
